/**
 * Created by ryan.cox on 2019-02-03.
 */
({

  getJob: function(component, jobID) {

        console.log('VolunteerJobLocationMapHelper > getJob - jobID: ' + jobID);

        // outcome is setting this value into the component attribute 'job'
        var job = null;

        // Create the action
        var doAction = true;
        var action = component.get("c.getVolunteerJob"); // method on the VolunteerEventController
        if (jobID) {
            action.setParams({
                "jobID": jobID
            });
        } else {
            doAction = false;
        }

        // Add callback behavior for when response is received
        action.setCallback(this, function(response) {
            console.log('VolunteerJobLocationMapHelper > getJob - response: ' + response.getState())
            var state = response.getState();
            if (state === "SUCCESS") {

                var jobList = response.getReturnValue();
                console.log('VolunteerJobLocationMapHelper > getJob - jobList: ' + JSON.stringify(jobList));
                if (jobList.length > 0) {
                    // job
                    var job = jobList[0];
                    component.set("v.job", job);

                    // map markers
                    var mapMarkers = [];
                    // if the job has a location
                    if (job.GW_Volunteers__Location_Street__c && job.GW_Volunteers__Location_City__c
                    && job.GW_Volunteers__Location__c && job.GW_Volunteers__Location_Zip_Postal_Code__c) {

                        var title = (job.Location_Name__c) ? '' + job.Location_Name__c : 'Job Location';

                        var address = job.GW_Volunteers__Location_Street__c + ' ' + job.GW_Volunteers__Location_City__c
                            + ', ' + job.GW_Volunteers__Location__c + ' ' + job.GW_Volunteers__Location_Zip_Postal_Code__c;

                        mapMarkers.push({
                            'location': {
                                'Street': job.GW_Volunteers__Location_Street__c,
                                'City': job.GW_Volunteers__Location_City__c,
                                'State': job.GW_Volunteers__Location__c,
                                'PostalCode': job.GW_Volunteers__Location_Zip_Postal_Code__c
                            },
                            'icon': 'utility:Tower',
                            'title' : title,
                            'description' : address
                       });
                       component.set("v.mapMarkers", mapMarkers);
                   }
                   console.log('VolunteerJobLocationMapHelper > getJob - mapMarkers: ' + JSON.stringify(mapMarkers));
                }
             }
             else {
                 console.log("VolunteerJobLocationMapHelper > getJob - failed with state: " + state);
             }
        });

        // Send action off to be executed
        if (doAction) {
            $A.enqueueAction(action);
        }

    }, // end getJob

})