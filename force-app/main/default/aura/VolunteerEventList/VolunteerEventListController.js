({

    init: function(component, event, helper) {

        console.log('VolunteerEventListController > init');

        helper.getCampaigns(component);

    }, // end init

})