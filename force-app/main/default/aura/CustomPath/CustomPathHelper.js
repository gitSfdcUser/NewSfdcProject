({
    CheckCurrentStageValue: function(component, event, helper) {
        console.log('CheckCurrentStageValue initiated');
        var action = component.get("c.getDefaultStepName");
        action.setParams({
            "recordId": component.get("v.recordId") // Pass the recordId to the Apex method
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var stepName = response.getReturnValue();
                console.log('stepName:::::' + stepName);
                // You can now use stepName as needed
            } else {
                console.log('Failed to fetch default step name');
            }
        });
        $A.enqueueAction(action);
    },

    UpdateStageValue: function(component, event, helper) {
        console.log('UpdateStageValue initiated');
        var action = component.get("c.updateStageValue");
        action.setParams({
            "stepName": component.get("v.stepName"), // Pass the stepName to the Apex method
            "recordId": component.get("v.recordId") // Pass the recordId to the Apex method
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var result = response.getReturnValue();
                console.log('Result:', result);
                // You can now use the result as needed
            } else {
                console.log('Failed to update stage');
            }
        });
        $A.enqueueAction(action);
    }
})