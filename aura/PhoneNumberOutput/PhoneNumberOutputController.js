({
	outputPhone : function(component, event, helper) {
		var text = event.getParam("phone");
		component.set("v.number", text);
	}
})