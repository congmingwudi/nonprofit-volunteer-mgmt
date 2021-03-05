public without sharing class VolunteerEventController {
    
    public static String getPageEventID() {

        String eventID = null;
        if (System.currentPageReference() != null) {
            eventID = System.currentPageReference().getParameters().get('id');
        }
        System.debug('VolunteerEventController > getPageEventID: ' + eventID);
        return eventID;

    } // end getPageEventID

    public static String getPageEventName() {

        String eventName = null;
        if (System.currentPageReference() != null) {
            eventName = System.currentPageReference().getParameters().get('event');
        }
        System.debug('VolunteerEventController > getPageEventName: ' + eventName);
        return eventName;

    } // end getPageEventName

    @AuraEnabled
    public static List<GW_Volunteers__Volunteer_Job__c> getVolunteerPositions() {

        System.debug('VolunteerEventController > getVolunteerPositions');

        List<GW_Volunteers__Volunteer_Job__c> jobList =
        [SELECT Id, Name, GW_Volunteers__Description__c FROM GW_Volunteers__Volunteer_Job__c
        WHERE GW_Volunteers__Display_on_Website__c  = true AND GW_Volunteers__Campaign__r.Name = 'Volunteer Positions'
        ORDER BY Name
        ];

        return jobList;

    } // end getVolunteerPositions

    @AuraEnabled
    public static List<Campaign> getCampaign(String campaignID, String campaignName) {

       	System.debug('VolunteerEventController > getCampaign - campaignID: ' + campaignID + ', campaignName: ' + campaignName);
       	if (campaignID != null) {
       		return [SELECT Id, Name, Description, IsActive FROM Campaign WHERE Id=:campaignID ORDER BY Name];
        } else {
            return [SELECT Id, Name, Description, IsActive FROM Campaign WHERE Name=:campaignName ORDER BY Name];
        }

    } // end getCampaign

    @AuraEnabled
    public static List<Campaign> getCampaigns() {

        System.debug('VolunteerEventController > getCampaigns');

        List<Campaign> campaigns = [SELECT Id, Name, Description, IsActive FROM Campaign
                WHERE isActive = true AND Display_on_Website__c = true
                ORDER BY Name
               ];

        campaigns = sortByCampaignsShiftStartDate(campaigns);

        return campaigns;

    } // end getCampaigns

    public static List<Campaign> sortByCampaignsShiftStartDate(List<Campaign> campaigns) {

        System.debug('VolunteerEventController > sortByCampaignsShiftStartDate - campaigns: ' + campaigns);

        // create map of <first shift dateTime, campaign Id>
        Map<Datetime, Campaign> firstShiftCampaignMap = new Map<Datetime, Campaign>();
        List<Campaign> noShiftCampaigns = new List<Campaign>();
        Integer padSeconds = 0;
        for (Integer i = 0; i < campaigns.size(); i++) {
            Campaign campaign = campaigns[i];
            Datetime firstShiftStartDate = getFirstShiftStartDate(campaign.Id);
            if (firstShiftStartDate != null) {
                if (firstShiftCampaignMap.containsKey(firstShiftStartDate)) {
                    // for identical shift start dateTimes, add seconds just for making unique in the map
                    firstShiftStartDate = firstShiftStartDate.addSeconds(++padSeconds);
                }
                firstShiftCampaignMap.put(firstShiftStartDate, campaign);
            } else {
                noShiftCampaigns.add(campaign);
            }
        }

        // sort first shift dateTimes
        List<Datetime> firstShifts = new List<Datetime>();
        firstShifts.addAll(firstShiftCampaignMap.keySet());
        //System.debug('VolunteerEventController > sortByCampaignsShiftStartDate - firstShifts: ' + firstShifts);
        firstShifts.sort();
        //System.debug('VolunteerEventController > sortByCampaignsShiftStartDate - firstShifts sorted: ' + firstShifts);

        // set sorted campaign list
        List<Campaign> sortedList = new List<Campaign>();
        for (Integer i = 0; i < firstShifts.size(); i++) {
            Datetime startDateTime = firstShifts[i];
            Campaign campaign = firstShiftCampaignMap.get(startDateTime);
            sortedList.add(campaign);
        }

        // add the noShiftCampaigns to the end of the sorted list
        for (Integer i = 0; i < noShiftCampaigns.size(); i++) {
            sortedList.add(noShiftCampaigns[i]);
        }

        System.debug('VolunteerEventController > sortByCampaignsShiftStartDate - sortedList: ' + sortedList);
        return sortedList;

    } // end sortByCampaignsShiftStartDate

    @AuraEnabled
    public static Datetime getFirstShiftStartDate(String campaignID) {

        System.debug('VolunteerEventController > getFirstShiftStartDate - campaignID: ' + campaignID);

        // return
        Datetime firstShiftStartDate = null;

        // get volunteer jobs, minimum fields for sorting by shift start date
        List<GW_Volunteers__Volunteer_Job__c> jobList = [
                SELECT Id, Name,
                (SELECT Id, Name, GW_Volunteers__Start_Date_Time__c FROM GW_Volunteers__Volunteer_Job_Slots__r
                 WHERE GW_Volunteers__Number_of_Volunteers_Still_Needed__c > 0 AND GW_Volunteers__Start_Date_Time__c >= TODAY AND Display_on_Website__c = true ORDER BY GW_Volunteers__Start_Date_Time__c)
                FROM GW_Volunteers__Volunteer_Job__c
                WHERE GW_Volunteers__Campaign__c = :campaignID AND GW_Volunteers__Display_on_Website__c = true
                ORDER BY Name
        ];

        if ((jobList != null) && (jobList.size() > 0)) {
            jobList = sortByJobsShiftStartDate(jobList);
            GW_Volunteers__Volunteer_Job__c job = jobList[0];
            if ((job.GW_Volunteers__Volunteer_Job_Slots__r != null) && (job.GW_Volunteers__Volunteer_Job_Slots__r.size() > 0)) {
                GW_Volunteers__Volunteer_Shift__c firstShift = job.GW_Volunteers__Volunteer_Job_Slots__r[0];
                firstShiftStartDate = firstShift.GW_Volunteers__Start_Date_Time__c;
            }
        }

        System.debug('VolunteerEventController > getFirstShiftStartDate - firstShiftStartDate: ' + firstShiftStartDate);
        return firstShiftStartDate;

    } // end getFirstShiftStartDate

    @AuraEnabled
    public static List<GW_Volunteers__Volunteer_Job__c> getVolunteerJobs(String campaignID) {

        System.debug('VolunteerEventController > getVolunteerJobs - campaignID: ' + campaignID);

        List<GW_Volunteers__Volunteer_Job__c> jobList =
        [SELECT Id, Name, GW_Volunteers__Description__c, Location_Name__c, Map_URL__c,
                GW_Volunteers__Location_Street__c, GW_Volunteers__Location_City__c, GW_Volunteers__Location__c, GW_Volunteers__Location_Zip_Postal_Code__c,
         (SELECT Id, Name, GW_Volunteers__Start_Date_Time__c, End_Date_Time__c, GW_Volunteers__Duration__c, GW_Volunteers__Number_of_Volunteers_Still_Needed__c FROM GW_Volunteers__Volunteer_Job_Slots__r
          WHERE GW_Volunteers__Number_of_Volunteers_Still_Needed__c > 0 AND GW_Volunteers__Start_Date_Time__c >= TODAY AND Display_on_Website__c = true ORDER BY GW_Volunteers__Start_Date_Time__c)
         FROM GW_Volunteers__Volunteer_Job__c
         WHERE GW_Volunteers__Campaign__c = :campaignID  AND GW_Volunteers__Display_on_Website__c  = true
         ORDER BY Name
        ];

        jobList = sortByJobsShiftStartDate(jobList);

        return jobList;

    } // end getVolunteerJobs

    public static List<GW_Volunteers__Volunteer_Job__c> sortByJobsShiftStartDate(List<GW_Volunteers__Volunteer_Job__c> jobList) {

        //System.debug('VolunteerEventController > sortByJobsShiftStartDate - jobList: ' + jobList);
        //System.debug('VolunteerEventController > sortByJobsShiftStartDate > job1 shifts: (size: ' + jobList[0].GW_Volunteers__Volunteer_Job_Slots__r.size() + ') ' + jobList[0].GW_Volunteers__Volunteer_Job_Slots__r);

        // create map of <first shift dateTime, job>
        Map<Datetime, GW_Volunteers__Volunteer_Job__c> firstShiftJobMap = new Map<Datetime, GW_Volunteers__Volunteer_Job__c>();
        List<GW_Volunteers__Volunteer_Job__c> noShiftJobs = new List<GW_Volunteers__Volunteer_Job__c>();
        Integer padSeconds = 0;
        for (Integer i = 0; i < jobList.size(); i++) {
            GW_Volunteers__Volunteer_Job__c job = jobList[i];
            if ((job.GW_Volunteers__Volunteer_Job_Slots__r != null) && (job.GW_Volunteers__Volunteer_Job_Slots__r.size() > 0)) {
                GW_Volunteers__Volunteer_Shift__c firstShift = job.GW_Volunteers__Volunteer_Job_Slots__r[0];
                Datetime startDateTime = firstShift.GW_Volunteers__Start_Date_Time__c;
                if (firstShiftJobMap.containsKey(startDateTime)) {
                    // for identical shift start dateTimes, add seconds just for making unique in the map
                    startDateTime = startDateTime.addSeconds(++padSeconds);
                }
                firstShiftJobMap.put(startDateTime, job);
            } else {
                noShiftJobs.add(job);
            }
        }
        //System.debug('VolunteerEventController > sortByJobsShiftStartDate - firstShiftJobMap: ' + firstShiftJobMap);
        //System.debug('VolunteerEventController > sortByJobsShiftStartDate - noShiftJobs: ' + noShiftJobs);

        // sort first shift dateTimes
        List<Datetime> firstShifts = new List<Datetime>();
        firstShifts.addAll(firstShiftJobMap.keySet());
        //System.debug('VolunteerEventController > sortByJobsShiftStartDate - firstShifts: ' + firstShifts);
        firstShifts.sort();
        //System.debug('VolunteerEventController > sortByJobsShiftStartDate - firstShifts sorted: ' + firstShifts);

        // set sorted job list
        List<GW_Volunteers__Volunteer_Job__c> sortedList = new List<GW_Volunteers__Volunteer_Job__c>();
        for (Integer i = 0; i < firstShifts.size(); i++) {
            Datetime startDateTime = firstShifts[i];
            GW_Volunteers__Volunteer_Job__c job = firstShiftJobMap.get(startDateTime);
            sortedList.add(job);
        }

        // add the noShiftJobs to the end of the sorted list
        for (Integer i = 0; i < noShiftJobs.size(); i++) {
            sortedList.add(noShiftJobs[i]);
        }

        //System.debug('VolunteerEventController > sortByJobsShiftStartDate - sortedList: ' + sortedList);
        return sortedList;

    } // end sortByJobsShiftStartDate

    @AuraEnabled
    public static List<GW_Volunteers__Volunteer_Job__c> getVolunteerJob(String jobID) {

        System.debug('VolunteerEventController > getVolunteerJob - jobID: ' + jobID);

        List<GW_Volunteers__Volunteer_Job__c> jobList =
        [SELECT Location_Name__c, GW_Volunteers__Location_Street__c, GW_Volunteers__Location_City__c, GW_Volunteers__Location__c, GW_Volunteers__Location_Zip_Postal_Code__c
         FROM GW_Volunteers__Volunteer_Job__c
         WHERE Id = :jobID
        ];

        return jobList;

    } // end getVolunteerJob

    @AuraEnabled
    public static List<GW_Volunteers__Volunteer_Shift__c> getVolunteerJobShift(String shiftID) {

        System.debug('VolunteerEventController > getVolunteerJobShift - shiftID: ' + shiftID);

        List<GW_Volunteers__Volunteer_Shift__c> shiftList =
        [SELECT Id, Name, GW_Volunteers__Start_Date_Time__c, End_Date_Time__c, GW_Volunteers__Duration__c,
                GW_Volunteers__Volunteer_Job__r.Id, GW_Volunteers__Volunteer_Job__r.Name,
                GW_Volunteers__Volunteer_Job__r.GW_Volunteers__Campaign__r.Name,
                GW_Volunteers__Volunteer_Job__r.GW_Volunteers__Campaign__r.Description
         FROM GW_Volunteers__Volunteer_Shift__c
         WHERE Id = :shiftID
         ORDER BY GW_Volunteers__Start_Date_Time__c
        ];

        return shiftList;

    } // end getVolunteerJobShift

    @AuraEnabled
    public static GW_Volunteers__Volunteer_Hours__c createShiftSignup(String signupChannel, String jobID, String shiftID, String startDateString,
            Contact contact, String deviceType, String familyJSON) {
        System.debug('VolunteerEventController > createShiftSignup - signupChannel: ' + signupChannel
                + ', jobID: ' + jobID + ', shiftID: ' + shiftID
                + ', startDateString: ' + startDateString + ', contact: ' + contact + ', deviceType: ' + deviceType
                + ', familyJSON: ' + familyJSON);

        List<GW_Volunteers__Volunteer_Hours__c> signupList = new List<GW_Volunteers__Volunteer_Hours__c>();

        // defaults
        if (signupChannel == null) {
            signupChannel = 'Internal';
        }
        if (deviceType == null) {
            deviceType = 'DESKTOP';
        }

        // send email confirmation
        Boolean sendEmailConfirmation = (signupChannel == 'Internal') ? false : true;

        // Volunteer Hours (represents a shift signup)
        GW_Volunteers__Volunteer_Hours__c signup = new GW_Volunteers__Volunteer_Hours__c();
        signup.Signup_Channel__c = signupChannel;
        signup.GW_Volunteers__Volunteer_Job__c = jobID;
        signup.GW_Volunteers__Volunteer_Shift__c = shiftID;
        signup.GW_Volunteers__Start_Date__c = Date.valueOf(startDateString);
        signup.GW_Volunteers__Status__c = 'Confirmed';
        signup.Device_Type__c = deviceType;
        signup.Send_Email_Confirmation__c = sendEmailConfirmation;

        System.debug('VolunteerEventController > createShiftSignup - contact: ' + contact);
        upsert contact Contact.fields.Email;
        //System.debug('VolunteerEventController > createShiftSignup - upserted contact: ' + contact);
        signup.GW_Volunteers__Contact__c = contact.Id;

        // add adult signup
        signupList.add(signup);

        // family
        if (familyJSON != null) {
            List<Contact> family = (List<Contact>) JSON.deserialize(familyJSON, List<Contact>.class);
            System.debug('VolunteerEventController > createShiftSignup - family: ' + family);

            if (family.size() > 0) {

                // get household account of adult contact
                List <Contact> adultContacts = [SELECT AccountId FROM Contact WHERE Id = :contact.Id];
                ID accountId = adultContacts[0].AccountId;

                // parent photo permission
                String parentPhotoPermission = contact.Photo_Permission__c;

                // insert family
                List<Contact> familyContacts = new List<Contact>();
                for (Contact familyMember : family) {
                    familyMember.AccountId = accountId;
                    familyMember.Photo_Permission__c = parentPhotoPermission;
                    familyContacts.add(familyMember);
                }
                //System.debug('VolunteerEventController > createShiftSignup -(before insert) familyContacts: ' + familyContacts);
                familyContacts = insertFamily(familyContacts);
                System.debug('VolunteerEventController > createShiftSignup - familyContacts to signup: ' + familyContacts);

                // insert relationships
                insertRelationships(contact.Id, familyContacts);

                // create family member signups
                for (Contact familyMember : familyContacts) {
                    GW_Volunteers__Volunteer_Hours__c familyMemberSignup = new GW_Volunteers__Volunteer_Hours__c();
                    familyMemberSignup.GW_Volunteers__Volunteer_Job__c = jobID;
                    familyMemberSignup.GW_Volunteers__Volunteer_Shift__c = shiftID;
                    familyMemberSignup.GW_Volunteers__Start_Date__c = Date.valueOf(startDateString);
                    familyMemberSignup.GW_Volunteers__Status__c = 'Confirmed';
                    familyMemberSignup.Device_Type__c = deviceType;
                    familyMemberSignup.GW_Volunteers__Contact__c = familyMember.Id;

                    // add familyMember signup
                    signupList.add(familyMemberSignup);
                }

            } // end if family members

        } // end if family
        
        // insert signups
        insert signupList;
        System.debug('VolunteerEventController > createShiftSignup - signups created ' + signupList.size() + ': ' + signupList);

        // return the adult/parent signup
        return signupList[0];

    } // end createShiftSignup

    public static List<Contact> insertFamily(List<Contact> family) {
        System.debug('VolunteerEventController > insertFamily - family: ' + family);

        // where clause
        List<String> or_conditions = new List<String>();
        for (Contact familyMember : family) {
            String condition = '(FirstName = \'' + familyMember.FirstName + '\' AND LastName = \'' + familyMember.LastName + '\')';
            or_conditions.add(condition);
        }
        String whereClause = String.join(or_conditions, ' OR ');

        // query
        String query = 'SELECT Id, FirstName, LastName, Birthdate FROM Contact WHERE ' + whereClause;
        //System.debug('VolunteerEventController > insertFamily - query for existing family members: ' + query);
        List<Contact> familyMemberContactsFound = Database.query(query);

        // check existing contacts
        List<Contact> existingContacts = new List<Contact>();
        List<Contact> newContacts = new List<Contact>();
        for (Contact familyMember : family) {
            Boolean found = false;
            for (Contact familyMemberContact : familyMemberContactsFound) {
                if ((familyMember.FirstName == familyMemberContact.FirstName) && (familyMember.LastName == familyMemberContact.LastName)) {
                    familyMember.Id = familyMemberContact.Id;
                    existingContacts.add(familyMember);
                    found = true;
                    break;
                }
            }
            if (!found) {
                Contact newFamilyMember = familyMember.clone();
                newFamilyMember.Description = null; // remove Description so the relationship type is not stored here in the contact
                newContacts.add(newFamilyMember);
            }
        }
        //System.debug('VolunteerEventController > insertFamily - existingContacts: ' + existingContacts);
        //System.debug('VolunteerEventController > insertFamily - newContacts: ' + newContacts);

        insert newContacts;

        // updatedFamily
        List<Contact> updatedFamily = existingContacts;
        for (Contact newContact : newContacts) {

            // set description that represents the relationship type back on the contact
            for (Contact familyMember : family) {
                if ((familyMember.FirstName == newContact.FirstName) && (familyMember.LastName == newContact.LastName)) {
                    newContact.Description = familyMember.Description;
                    break;
                }
            }

            updatedFamily.add(newContact);
        }
        return updatedFamily;

    } // end insertFamily

    public static void insertRelationships(ID adultID, List<Contact> familyContacts) {
        System.debug('VolunteerEventController > insertRelationships - adultID: ' + adultID + ', familyContacts: ' + familyContacts);

        // where clause
        List<String> or_conditions = new List<String>();
        for (Contact familyMember : familyContacts) {
            String condition = '(npe4__RelatedContact__c = \'' + familyMember.Id + '\')';
            or_conditions.add(condition);
        }
        String whereClause = '(npe4__Contact__c = \'' + adultID + '\') AND (' + String.join(or_conditions, ' OR ') + ')';

        // query
        String query = 'SELECT npe4__RelatedContact__c FROM npe4__Relationship__c WHERE ' + whereClause;
        //System.debug('VolunteerEventController > insertRelationships - query for existing relationships: ' + query);
        List<npe4__Relationship__c> relationshipsFound = Database.query(query);
        //System.debug('VolunteerEventController > insertRelationships - existing relationships: ' + relationshipsFound);

        // check existing relationships
        List<npe4__Relationship__c> existingRelationships = new List<npe4__Relationship__c>();
        List<npe4__Relationship__c> newRelationships = new List<npe4__Relationship__c>();
        for (Contact familyMember : familyContacts) {
            Boolean found = false;
            for (npe4__Relationship__c relationship : relationshipsFound) {
                // if relationship already exists between the adult contact and the family member
                if (familyMember.Id == relationship.npe4__RelatedContact__c) {
                    existingRelationships.add(relationship);
                    found = true;
                    break;
                }
            }
            if (!found) {
                // new relationship to create
                npe4__Relationship__c relationship = new npe4__Relationship__c();
                relationship.npe4__Contact__c = adultID;
                relationship.npe4__RelatedContact__c = familyMember.Id;
                relationship.npe4__Type__c = familyMember.Description;
                relationship.npe4__Status__c = 'Current';
                newRelationships.add(relationship);
            }
        }
        //System.debug('VolunteerEventController > insertRelationships - existingRelationships: ' + existingRelationships);
        //System.debug('VolunteerEventController > insertRelationships - newRelationships: ' + newRelationships);

        insert newRelationships;

    } // end insertRelationships

} // end VolunteerEventController