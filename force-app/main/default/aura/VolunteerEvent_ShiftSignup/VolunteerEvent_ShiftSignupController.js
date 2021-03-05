/**
 * Created by ryan.cox on 2019-01-16.
 */
({

    init: function(component, event, helper) {

            var shiftID = component.get('v.shiftID');
            console.log('VolunteerEvent_ShiftSignupController > init - shiftID: ' + shiftID);

            helper.getJobShift(component, shiftID);
            helper.setPhotoPermissionText(component);

    }, // end init

    signupFamilyChanged: function(component, event, helper) {

        // toggle - this is a workaround for the 'value' attribute not updating for input type="checkbox"
        var signupFamily = component.get("v.signupFamily");
        component.set("v.signupFamily", !signupFamily);

        // update photo permission field
        helper.setPhotoPermissionText(component);

        console.log('VolunteerEvent_ShiftSignupController > signupFamilyChanged: ' + signupFamily);

    }, // end signupFamily

    handleNavigation : function(component, event, helper) {

        // set 'navigation' attribute that the flow will use to determine flow path
        var buttonClicked = event.getSource().getLocalId();
        component.set('v.navigation', buttonClicked);
        console.log('VolunteerEvent_ShiftSignupController > handleNavigation - clicked: ' + buttonClicked);

        if (buttonClicked == "nav_cancel") {
            // go forward in the flow; this does the same thing as the "Next" button in the standard flow footer
            var navigate = component.get("v.navigateFlow");
            if (navigate) {
                navigate("NEXT");
            }
        } else {
            // submit signup
            helper.submitSignup(component);
        }

    }, // end handleNavigation

    signUpCreated: function(component, event, helper) {

        console.log('VolunteerEvent_ShiftSignupController > signUpCreated');

        // hide loading spinner
        component.set('v.isLoading', false);

        // set 'navigation' attribute that the flow will use to determine flow path
        component.set('v.navigation', 'nav_submitted');

        // go forward in the flow; this does the same thing as the "Next" button in the standard flow footer
        var navigate = component.get("v.navigateFlow");
        if (navigate) {
            navigate("NEXT");
        }

    }, // end signUpCreated


})