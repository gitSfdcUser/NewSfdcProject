({
    handleSelect: function(component, event, helper) {
        var stepName = event.getParam("detail").value;
        component.set("v.stepName", stepName); // Store the stepName in a component attribute
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            "title": "Success!",
            "message": "Toast from " + stepName
        });
        toastEvent.fire();
    },
    handleStageChange: function(component, event, helper) {
        var stepName = component.get("v.stepName");
        
        if (!stepName) {
            // Call getDefaultStepName method from helper
            helper.CheckCurrentStageValue(component, event, helper);
        } else if (stepName === "Closed") { // Corrected condition to check for "Closed" step
            component.set("v.isModalOpen", true); // Open the modal
        } else {
            // Call UpdateStageValue method from helper
            helper.UpdateStageValue(component, event, helper);
        }
    },
   openModel: function(component, event, helper) {
      // Set isModalOpen attribute to true
      component.set("v.isModalOpen", true);
   },
  
   closeModel: function(component, event, helper) {
      // Set isModalOpen attribute to false  
      component.set("v.isModalOpen", false);
   },
  
   submitDetails: function(component, event, helper) {
      // Set isModalOpen attribute to false
      //Add your code to call apex method or do some processing
      component.set("v.isModalOpen", false);
   }
})