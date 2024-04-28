({
    init : function(component, event, helper) {
        var caseId = component.get("v.caseId");
        // Call Apex controller method to fetch PDF files
        var action = component.get("c.getPdfFiles");
        action.setParams({
            caseId: caseId
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.pdfFiles", response.getReturnValue());
            } else {
                console.log("Failed with state: " + state);
            }
        });
        $A.enqueueAction(action);
    }
})