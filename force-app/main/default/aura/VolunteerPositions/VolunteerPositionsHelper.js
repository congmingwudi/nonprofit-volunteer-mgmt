({

    getVolunteerPositions: function(component) {

            console.log('getVolunteerPositionsHelper > getVolunteerPositions');

            // Create the action
            var action = component.get("c.getVolunteerPositions"); // method on the VolunteerEventController

            // Add callback behavior for when response is received
            action.setCallback(this, function(response) {
                console.log('getVolunteerPositionsHelper > getVolunteerPositions response: ' + response.getState())
                var state = response.getState();
                if (state === "SUCCESS") {

                    // jobList
                    var jobList = response.getReturnValue();
                    console.log('getVolunteerPositionsHelper > getVolunteerPositions - jobList: ' + JSON.stringify(jobList));
                    component.set("v.jobList", jobList);

                }
                else {
                    console.log("getVolunteerPositionsHelper > getVolunteerPositions - failed with state: " + state);
                }
            });

            // Send action off to be executed
            $A.enqueueAction(action);

        }, // end getVolunteerPositions

})