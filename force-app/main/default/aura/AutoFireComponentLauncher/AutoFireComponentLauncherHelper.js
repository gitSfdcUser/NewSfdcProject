({
    openFirstUtility : function(component, event, helper) {
                      console.log('openFirstUtility ::::::');

        var utilityAPI = component.find("utilitybar");
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