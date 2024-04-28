({
    wiredRecord: function(component, event, helper) {
        var recordData = component.find("recordData");
        recordData.reloadRecord(true, function(result) {
            if (result.state === "SUCCESS") {
                var record = result.record;
                var error = result.error;
                
                if (error) {
                    console.log("Error occurred");
                } else {
                    var interaction = record.fields;
                    var modifiedDate = interaction.LastModifiedDate.value;
                    
                    if (!component.get("v.lastModifiedDate")) {
                        component.set("v.lastModifiedDate", modifiedDate);
                    }
                    
                    if (modifiedDate !== component.get("v.lastModifiedDate") && interaction.Status__c.value === "Completed" && interaction.Next_Steps__c.value === "Schedule follow-up") {
                        helper.navigateToNewAccountPage(component);
                    }
                }
            } else if (result.state === "ERROR") {
                console.log("Error occurred");
            }
        });
    }
})