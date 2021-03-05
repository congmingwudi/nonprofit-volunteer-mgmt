/**
 * Created by ryan.cox on 2019-01-16.
 */
({

   getJobShift: function(component, shiftID) {

        console.log('VolunteerEvent_ShiftSignupHelper > getJobShift - shiftID: ' + shiftID);

        // outcome is setting this value into the component attribute 'shift'
        var shift = null;

        // Create the action
        var doAction = true;
        var action = component.get("c.getVolunteerJobShift"); // method on the VolunteerEventController
        if (shiftID != '') {
            action.setParams({
                "shiftID": shiftID
            });
        } else {
            doAction = false;
        }

        // Add callback behavior for when response is received
        action.setCallback(this, function(response) {
            console.log('VolunteerEvent_ShiftSignupHelper > getJobShift response: ' + response.getState())
            var state = response.getState();
            if (state === "SUCCESS") {

                var shiftList = response.getReturnValue();
                console.log('VolunteerEvent_ShiftSignupHelper > getJobShift shiftList: ' + JSON.stringify(shiftList));
                if (shiftList.length > 0) {
                    // shift
                    var shift = shiftList[0];
                    component.set("v.shift", shift);
                    var shiftStartTime = this.formatDateString(shift.GW_Volunteers__Start_Date_Time__c);
                    component.set("v.shiftStartTime", shiftStartTime);
                    var shiftEndTime = this.formatDateString(shift.End_Date_Time__c);
                    component.set("v.shiftEndTime", shiftEndTime);
                    component.set("v.shiftDuration", shift.GW_Volunteers__Duration__c);

                    // campaign
                    component.set("v.campaign", shift.GW_Volunteers__Volunteer_Job__r.GW_Volunteers__Campaign__r);

                    // job
                    component.set("v.job", shift.GW_Volunteers__Volunteer_Job__r);
                }
             }
             else {
                 console.log("VolunteerEvent_ShiftSignupHelper > getJobShift - failed with state: " + state);
             }
        });

        // Send action off to be executed
        if (doAction) {
            $A.enqueueAction(action);
        }

    }, // end getVolunteerJobs

    getDeviceType: function(component) {
        return $A.get("$Browser.formFactor");
    },

    formatDateString: function(dateString) {

         //console.log('VolunteerJobShiftListController > formatDateString - dateString in: ' + dateString);
         dateString = $A.localizationService.formatDate(dateString, "EEE MMM d, yyyy hh:mm a");
         //console.log('VolunteerJobShiftListController > formatDateString - date out: ' + dateString);
         return dateString;

    }, // end formatDateString

    setPhotoPermissionText: function(component) {

        var signupFamily = component.get("v.signupFamily");
        var photoPermissionLabel;
        var photoPermissionOptions;

        if (!signupFamily) {
            photoPermissionLabel = "Do you give WeeCycle permission to use photos taken of you during WeeCycle events?";
            photoPermissionOptions = [
                {'label': 'Yes, I give WeeCycle permission to use photos of me.', 'value': 'Yes'},
                {'label': 'No, I DO NOT give WeeCycle permission to use photos of me.', 'value': 'No'}
            ]

        } else {
            photoPermissionLabel = "Do you give WeeCycle permission to use photos taken of you and your family during WeeCycle events?";
            photoPermissionOptions = [
                {'label': 'Yes, I give WeeCycle permission to use photos of me and my family.', 'value': 'Yes'},
                {'label': 'No, I DO NOT give WeeCycle permission to use photos of me and my family.', 'value': 'No'}
            ]
        }

        component.set("v.photoPermissionLabel", photoPermissionLabel);
        component.set("v.photoPermissionOptions", photoPermissionOptions);

    }, // end setPhotoPermissionText

   submitSignup: function(component) {

        var jobID = component.get("v.job.Id");
        var shift = component.get("v.shift");
        var contact = component.get("v.contact");
        contact.Photo_Permission__c = component.get("v.photoPermission");

        // signupChannel
        var signupChannel = component.get('v.signupChannel');

        // device type
        var deviceType = this.getDeviceType();

        // family
        var signupFamily = component.get("v.signupFamily");
        var family = [];
        if (signupFamily) { family = component.get("v.family"); }

        console.log('VolunteerEvent_ShiftSignupHelper > submitSignup - signupChannel: ' + signupChannel + ', jobID: ' + jobID + ', shift: ' + JSON.stringify(shift)
            + ', contact: ' + JSON.stringify(contact) + ', deviceType: ' + deviceType + ', signupFamily: ' + signupFamily);

        var allGood = (jobID != null) && (shift != null) && (contact != null) && this.validateFields(component);
        console.log('VolunteerEvent_ShiftSignupHelper > submitSignup - allGood: ' + allGood);

        if (allGood) {
            // show loading spinner
            component.set('v.isLoading', true);

            // submit signup
            this.createShiftSignup(component, signupChannel, jobID, shift, contact, deviceType, family);
        }

    }, // end submitSignup

    validateFields: function (component) {

        console.log('VolunteerEvent_ShiftSignupHelper > validateFields');

        // checks all fields
        var allGood = component.find('field').reduce(function (validSoFar, inputCmp) {
            inputCmp.reportValidity();
            return validSoFar && inputCmp.checkValidity();
        }, true);

        // trim field values to prevent white spaces from causing issues when looking up existing contacts
        var firstName = component.get('v.contact.FirstName');
        if (firstName != null) {
            firstName = firstName.trim();
            component.set('v.contact.FirstName', firstName);
        }

        var lastName = component.get('v.contact.LastName');
        if (lastName != null) {
            lastName = lastName.trim();
            component.set('v.contact.LastName', lastName);
        }

        var email = component.get('v.contact.Email');
        if (email != null) {
            email = email.trim();
            component.set('v.contact.Email', email);
        }

        var phone = component.get('v.contact.MobilePhone');
        if (phone != null) {
            phone = phone.trim();
            if (phone.length == 10) {
                phone = phone.substring(0,3) + '-' + phone.substring(3,6) + '-' + phone.substring(6,10);
            }
            component.set('v.contact.MobilePhone', phone);
        }

        return allGood;

    }, // end validateFields

    createShiftSignup: function(component, signupChannel, jobID, shift, contact, deviceType, family) {

         console.log('VolunteerEvent_ShiftSignupHelper > createShiftSignup - signupChannel: ' + signupChannel + ', jobID: ' + jobID + ', shift: ' + JSON.stringify(shift)
            + ', contact: ' + JSON.stringify(contact) + ', deviceType: ' + deviceType + ', family: ' + JSON.stringify(family));

         // Create the action
         if (jobID && shift && contact && deviceType) {
             var action = component.get("c.createShiftSignup"); // method on the VolunteerEventController
             action.setParams({
                 "signupChannel": signupChannel,
                 "jobID": jobID,
                 "shiftID": shift.Id,
                 "startDateString": shift.GW_Volunteers__Start_Date_Time__c,
                 "contact": contact,
                 "deviceType": deviceType,
                 "familyJSON": JSON.stringify(family)
             });

             // Add callback behavior for when response is received
             action.setCallback(this, function(response) {
                 console.log('VolunteerEvent_ShiftSignupHelper > createShiftSignup response: ' + response.getState())
                 var state = response.getState();
                 if (state === "SUCCESS") {
                     // signup
                     var signup = response.getReturnValue();
                     console.log('VolunteerEvent_ShiftSignupHelper > createShiftSignup - signup created: ' + JSON.stringify(signup));
                     component.set('v.signup', signup);

                     // set signupCreated - the component change handler is fired to navigate forward in the flow
                     component.set("v.signupCreated", true);
                 }
                 else {
                     console.log("VolunteerEvent_ShiftSignupHelper > createShiftSignup - failed with state: " + state);
                 }
             });

             // Send action off to be executed
            $A.enqueueAction(action);
        }

     }, // end createShiftSignup

})