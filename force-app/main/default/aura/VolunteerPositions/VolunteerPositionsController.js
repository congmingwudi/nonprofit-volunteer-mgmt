({

    init: function(component, event, helper) {

        console.log(helper.controllerFile() + ' > init');

        helper.getVolunteerPositions(component);

    }, // end init

})