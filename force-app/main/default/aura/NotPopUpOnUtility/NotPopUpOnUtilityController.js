({
    openProgarm: function(component, event, helper) {
        var utilityAPI = component.find("utilitybar");
        utilityAPI.getAllUtilityInfo().then(function (response) {
            if (typeof response !== 'undefined') {
                utilityAPI.openUtility();
                // Call the toggleModalBox function after opening the utility
              //  helper.toggleModalBox(component, event, helper);
            }
        });
    }

})