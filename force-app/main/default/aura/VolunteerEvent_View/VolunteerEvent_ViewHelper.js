/**
 * Created by ryan.cox on 2019-01-16.
 */
({
    getCampaign: function(component, eventID, eventName) {

        console.log('VolunteerEvent_ViewHelper > getCampaign - eventID: ' + eventID + ', eventName: ' + eventName);

        // Create the action
        var doAction = true;
        var action = component.get("c.getCampaign"); // method on the VolunteerEventController
        if (eventID && (eventID != '')) {
            action.setParams({
                "campaignID": eventID
            });
        } else if (eventName && (eventName != '')) {
            action.setParams({
                "campaignName": eventName
            });
        } else {
            // no input parameters to find Order
            doAction = false;
        }

        // Add callback behavior for when response is received
        action.setCallback(this, function(response) {
            console.log('VolunteerEvent_ViewHelper > getCampaign response: ' + response.getState())
            var state = response.getState();
            if (state === "SUCCESS") {

               	// campaignList
                var campaignList = response.getReturnValue();
            	console.log('VolunteerEvent_ViewHelper > getCampaign - campaignList: ' + JSON.stringify(campaignList));

                if (campaignList.length > 0) {
                    var campaign = campaignList[0];
                    component.set("v.campaign", campaign);
                    eventID = campaign.Id;
                    component.set("v.eventID", eventID);
                    component.set("v.eventName", campaign.Name);

                    if (campaign.IsActive) {
                        component.set("v.eventIsActive", true);
                        this.getVolunteerJobs(component, eventID);
                    } else {
                        component.set("v.eventIsActive", false);
                    }

                } // if campaigns returned

            }
            else {
                console.log("VolunteerEvent_ViewHelper > getCampaign - failed with state: " + state);
            }
        });

        // Send action off to be executed
        if (doAction) {
        	$A.enqueueAction(action);
        }

    }, // end getCampaign

    getVolunteerJobs: function(component, eventID) {

         // retrieve event volunteer jobs, including job shifts
        console.log('VolunteerEvent_ViewHelper > getVolunteerJobs - eventID: ' + eventID);

         // outcome is setting this value into the component attribute 'jobList'
         var jobList = null;

         // Create the action
         var doAction = true;
         var action = component.get("c.getVolunteerJobs"); // method on the VolunteerEventController
         if (eventID != '') {
             action.setParams({
                 "campaignID": eventID
             });
         } else {
             doAction = false;
         }

         // Add callback behavior for when response is received
         action.setCallback(this, function(response) {
             console.log('VolunteerEvent_ViewHelper > getVolunteerJobs response: ' + response.getState())
             var state = response.getState();
             if (state === "SUCCESS") {

                 // jobList
                 jobList = response.getReturnValue();
             	 console.log('VolunteerEvent_ViewHelper > getVolunteerJobs jobList: ' + JSON.stringify(jobList));
                 component.set("v.jobList", jobList);

             }
             else {
                 console.log("VolunteerEvent_ViewHelper > getVolunteerJobs - failed with state: " + state);
             }
         });

         // Send action off to be executed
         if (doAction) {
         	$A.enqueueAction(action);
          }

     }, // end getVolunteerJobs

})