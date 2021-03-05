({

    getCampaigns: function(component) {

        console.log('VolunteerEventListHelper > getCampaigns');

        // Create the action
        var action = component.get("c.getCampaigns"); // method on the VolunteerEventController

        // Add callback behavior for when response is received
        action.setCallback(this, function(response) {
            console.log('VolunteerEventListHelper > getCampaigns response: ' + response.getState())
            var state = response.getState();
            if (state === "SUCCESS") {

                // campaignList
                var campaignList = response.getReturnValue();
                console.log('VolunteerEventListHelper > getCampaigns - campaignList: ' + JSON.stringify(campaignList));
                component.set("v.campaignList", campaignList);

            }
            else {
                console.log("VolunteerEventListHelper > getCampaigns - failed with state: " + state);
            }
        });

        // Send action off to be executed
        $A.enqueueAction(action);

    }, // end getCampaigns

})