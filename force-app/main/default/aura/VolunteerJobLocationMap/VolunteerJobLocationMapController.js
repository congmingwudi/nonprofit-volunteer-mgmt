/**
 * Created by ryan.cox on 2019-02-03.
 */
({

    init: function(component, event, helper) {

        var jobID = component.get("v.recordId");
        console.log('VolunteerJobLocationMapController > init - jobID: ' + jobID);

        helper.getJob(component, jobID);

    } // end init

})