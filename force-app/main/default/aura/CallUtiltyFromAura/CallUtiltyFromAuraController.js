({
    openFirstUtility : function(component, event, helper) {
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
             // Set up a timer to call onInit every 5 seconds
        setInterval($A.getCallback(function() {
            openFirstUtility(component, event, helper);
        }), 5000); // 5000 milliseconds = 5 seconds
    }
})