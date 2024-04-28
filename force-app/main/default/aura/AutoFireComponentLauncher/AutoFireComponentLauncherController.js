({
    openFirstUtility : function(component, event, helper) {
        var utilityAPI = component.find("utilitybar");
        console.log('utilityAPI:::::'+utilityAPI);
        utilityAPI.getAllUtilityInfo().then(function(response) {
            var myUtilityInfo = response[0];
            utilityAPI.openUtility({
                utilityId: myUtilityInfo.id
            });
       })
        .catch(function(error) {
            console.log(error);

        });
    }
})