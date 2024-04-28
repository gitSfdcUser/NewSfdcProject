({
    init: function(component, event, helper) {
        // Initialize the component here
        
        // Open the modal
        component.set("v.showModal", true);
        
        var flow = component.find("flowData");
        flow.startFlow("Dano__Create_a_Case");
    },
    
    closeModal: function(component, event, helper) {
        // Close the modal
        component.set("v.showModal", false);
    },

    handleFlowStatusChange: function(component, event, helper) {
        var flow = component.find("flowData");
        if (event.getParam("status") === "FINISHED") {
            // Close the modal when the flow has finished
            component.set("v.showModal", false);
            
            // Reset the flow for future use
            flow.reset();
        }
    }
})