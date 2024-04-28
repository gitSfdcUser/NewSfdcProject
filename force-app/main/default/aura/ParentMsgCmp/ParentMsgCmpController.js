({
	handleShow : function(component, event, helper) {
		component.find("messages").show("This is a confirmation Message for My knowledge of Aura");
	},
    handleError : function(component, event, helper) {
        component.find("messages").error("Error : While learning You will get lots of error Message");

	},
    handleRemove: function(component, event, helper) {
				component.find("messages").remove();

	}
})