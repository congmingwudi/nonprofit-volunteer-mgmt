@isTest
private class VolunteerEventController_Test {


    @isTest static void test_getPageAttributes() {

        System.debug('VolunteerEventController_Test >> test_getPageEventID > start');
        VolunteerEventController.getPageEventID();
        VolunteerEventController.getPageEventName();

    } // end test_getPageAttributes

    @isTest static void test_VolunteerEvent() {

        System.debug('VolunteerEventController_Test >> test_VolunteerEvent > start');

        test.startTest();

        // test data

        // campaign1
        Campaign campaign = new Campaign();
        campaign.Name = 'campaign1';
        campaign.Display_on_Website__c = true;
        campaign.isActive = true;
        insert campaign;

        GW_Volunteers__Volunteer_Job__c job1 = new GW_Volunteers__Volunteer_Job__c();
        job1.GW_Volunteers__Campaign__c = campaign.Id;
        job1.Location_Name__c = 'WeeCycle Warehouse';
        job1.Name = 'job1';
        job1.GW_Volunteers__Display_on_Website__c = true;
        insert job1;

            GW_Volunteers__Volunteer_Shift__c shift1 = new GW_Volunteers__Volunteer_Shift__c();
            shift1.GW_Volunteers__Volunteer_Job__c = job1.Id;
            shift1.GW_Volunteers__Start_Date_Time__c = System.now() + 4; // 4 days from now
            shift1.GW_Volunteers__Duration__c = 1;
            shift1.Display_on_Website__c = true;
            shift1.GW_Volunteers__Desired_Number_of_Volunteers__c = 10;
            insert shift1;

        GW_Volunteers__Volunteer_Job__c job2 = new GW_Volunteers__Volunteer_Job__c();
        job2.GW_Volunteers__Campaign__c = campaign.Id;
        //job2.Location_Name__c = 'WeeCycle Warehouse';
        job2.Name = 'job2';
        job2.GW_Volunteers__Display_on_Website__c = true;
        insert job2;

            GW_Volunteers__Volunteer_Shift__c shift2 = new GW_Volunteers__Volunteer_Shift__c();
            shift2.GW_Volunteers__Volunteer_Job__c = job2.Id;
            shift2.GW_Volunteers__Start_Date_Time__c = System.now() + 3; // 3 days from now
            shift2.GW_Volunteers__Duration__c = 1;
            shift2.Display_on_Website__c = true;
            shift2.GW_Volunteers__Desired_Number_of_Volunteers__c = 10;
            insert shift2;

        GW_Volunteers__Volunteer_Job__c job3 = new GW_Volunteers__Volunteer_Job__c();
        job3.GW_Volunteers__Campaign__c = campaign.Id;
        job3.Location_Name__c = 'WeeCycle Warehouse';
        job3.Name = 'job3';
        job3.GW_Volunteers__Display_on_Website__c = true;
        insert job3;

            GW_Volunteers__Volunteer_Shift__c shift3 = new GW_Volunteers__Volunteer_Shift__c();
            shift3.GW_Volunteers__Volunteer_Job__c = job3.Id;
            shift3.GW_Volunteers__Start_Date_Time__c = shift2.GW_Volunteers__Start_Date_Time__c; // same dateTime as shift2
            shift3.GW_Volunteers__Duration__c = 1;
            shift3.Display_on_Website__c = true;
            shift3.GW_Volunteers__Desired_Number_of_Volunteers__c = 10;
            insert shift3;

        GW_Volunteers__Volunteer_Job__c job4 = new GW_Volunteers__Volunteer_Job__c();
        job4.GW_Volunteers__Campaign__c = campaign.Id;
        job4.Location_Name__c = 'WeeCycle Warehouse';
        job4.Name = 'job4';
        job4.GW_Volunteers__Display_on_Website__c = true;
        insert job4;

            GW_Volunteers__Volunteer_Shift__c shift4 = new GW_Volunteers__Volunteer_Shift__c();
            shift4.GW_Volunteers__Volunteer_Job__c = job4.Id;
            shift4.GW_Volunteers__Start_Date_Time__c = System.now() + 2; // 2 days from now
            shift4.GW_Volunteers__Duration__c = 1;
            shift4.Display_on_Website__c = true;
            shift4.GW_Volunteers__Desired_Number_of_Volunteers__c = 10;
            insert shift4;

        // job with no shifts
        GW_Volunteers__Volunteer_Job__c job5 = new GW_Volunteers__Volunteer_Job__c();
        job5.GW_Volunteers__Campaign__c = campaign.Id;
        job5.Location_Name__c = 'WeeCycle Warehouse';
        job5.Name = 'job5';
        job5.GW_Volunteers__Display_on_Website__c = true;
        insert job5;

        /*
        // check shifts
        List<GW_Volunteers__Volunteer_Shift__c> shiftList =
        [SELECT Id, Name, GW_Volunteers__Volunteer_Job__c, GW_Volunteers__Start_Date_Time__c, End_Date_Time__c, GW_Volunteers__Duration__c, GW_Volunteers__Number_of_Volunteers_Still_Needed__c FROM GW_Volunteers__Volunteer_Shift__c
        WHERE GW_Volunteers__Number_of_Volunteers_Still_Needed__c > 0 AND GW_Volunteers__Start_Date_Time__c >= TODAY AND Display_on_Website__c = true AND ((GW_Volunteers__Volunteer_Job__c = :job1.Id) OR (GW_Volunteers__Volunteer_Job__c = :job2.Id))
        ORDER BY GW_Volunteers__Start_Date_Time__c];
        System.debug('VolunteerEventController_Test >> test_VolunteerEvent > shiftList: ' + shiftList);

        // test jobList
        List<GW_Volunteers__Volunteer_Job__c> jobList =
        [SELECT Id, Name, GW_Volunteers__Description__c, Location_Name__c, Map_URL__c,
                GW_Volunteers__Location_Street__c, GW_Volunteers__Location_City__c, GW_Volunteers__Location__c, GW_Volunteers__Location_Zip_Postal_Code__c,
        (SELECT Id, Name, GW_Volunteers__Start_Date_Time__c, End_Date_Time__c, GW_Volunteers__Duration__c, GW_Volunteers__Number_of_Volunteers_Still_Needed__c FROM GW_Volunteers__Volunteer_Job_Slots__r
        WHERE GW_Volunteers__Number_of_Volunteers_Still_Needed__c > 0 AND GW_Volunteers__Start_Date_Time__c >= TODAY AND Display_on_Website__c = true ORDER BY GW_Volunteers__Start_Date_Time__c)
        FROM GW_Volunteers__Volunteer_Job__c
        WHERE GW_Volunteers__Campaign__c = :campaign.Id  AND GW_Volunteers__Display_on_Website__c  = true
        ORDER BY Name
        ];
        System.debug('VolunteerEventController_Test >> test_VolunteerEvent > jobList: ' + jobList);
        System.debug('VolunteerEventController_Test >> test_VolunteerEvent > job1 shifts: ' + jobList[0].GW_Volunteers__Volunteer_Job_Slots__r);
        */

        // campaign2
        Campaign campaign2 = new Campaign();
        campaign2.Name = 'campaign2';
        campaign2.Display_on_Website__c = true;
        campaign2.isActive = true;
        insert campaign2;

        job1 = new GW_Volunteers__Volunteer_Job__c();
        job1.GW_Volunteers__Campaign__c = campaign2.Id;
        job1.Location_Name__c = 'WeeCycle Warehouse';
        job1.Name = 'job1';
        job1.GW_Volunteers__Display_on_Website__c = true;
        insert job1;

            shift1 = new GW_Volunteers__Volunteer_Shift__c();
            shift1.GW_Volunteers__Volunteer_Job__c = job1.Id;
            shift1.GW_Volunteers__Start_Date_Time__c = System.now() + 1; // 1 day from now
            shift1.GW_Volunteers__Duration__c = 1;
            shift1.Display_on_Website__c = true;
            shift1.GW_Volunteers__Desired_Number_of_Volunteers__c = 10;
            insert shift1;

        // campaign3
        Campaign campaign3 = new Campaign();
        campaign3.Name = 'campaign3';
        campaign3.Display_on_Website__c = true;
        campaign3.isActive = true;
        insert campaign3;

        Contact contact = new Contact();
        contact.FirstName = 'Ryan';
        contact.LastName = 'Cox';
        contact.Email = 'photomistic@gmail.com';
        contact.Photo_Permission__c = 'Yes';
        contact.Birthdate = Date.today();
        insert contact;

        // getCampaigns
        List<Campaign> eventList = VolunteerEventController.getCampaigns();

        // getCampaign
        eventList = VolunteerEventController.getCampaign(campaign.Id, null);
        eventList = VolunteerEventController.getCampaign(null, campaign.Name);

        // getVolunteerJob
        List<GW_Volunteers__Volunteer_Job__c> jobs = VolunteerEventController.getVolunteerJob(job1.Id);

        // getVolunteerPositions
        jobs = VolunteerEventController.getVolunteerPositions();

        // getVolunteerJobs
        jobs = VolunteerEventController.getVolunteerJobs(campaign.Id);

        // getVolunteerJobShift
        List<GW_Volunteers__Volunteer_Shift__c> shifts = VolunteerEventController.getVolunteerJobShift(shift1.Id);

        // getOrganization
        String orgName = VolunteerEventController.getOrganizationName();
        System.debug('VolunteerEventController_Test >> test_VolunteerEvent > orgName: ' + orgName);
        
        // family
        Contact familyMember1 = new Contact();
        familyMember1.FirstName = 'Bilbo';
        familyMember1.LastName = 'Cox';
        familyMember1.Birthdate = Date.today();
        familyMember1.Description = 'Son';
        insert familyMember1; // this will be an existing contact

            // relationship
            npe4__Relationship__c relationship = new npe4__Relationship__c();
            relationship.npe4__Contact__c = contact.Id; // adult/parent contact
            relationship.npe4__RelatedContact__c = familyMember1.Id;
            relationship.npe4__Type__c = familyMember1.Description;
            insert relationship;

        Contact familyMember2 = new Contact();
        familyMember2.FirstName = 'Lucinda';
        familyMember2.LastName = 'Williams';
        familyMember2.Birthdate = Date.today();
        familyMember2.Description = 'Daughter';

        List<Contact> family = new List<Contact>();
        family.add(familyMember1);
        family.add(familyMember2);
        String familyJSON = JSON.Serialize(family);

        // createShiftSignup
        String startDateString = '2019-01-19';
        String deviceType = 'DESKTOP';
        String singupChannel = 'Website';
        GW_Volunteers__Volunteer_Hours__c signup1 = VolunteerEventController.createShiftSignup(singupChannel, job1.Id, shift1.Id, startDateString, contact, deviceType, familyJSON);

        deviceType = null;
        singupChannel = null;
        GW_Volunteers__Volunteer_Hours__c signup2 = VolunteerEventController.createShiftSignup(singupChannel, job2.Id, shift2.Id, startDateString, contact, deviceType, familyJSON);

        test.stopTest();

    } // end test_VolunteerEvent

}