({
	getLabel : function(component, event, helper) {
		var mylabel = component.find("button1").get("v.label");
        component.set("v.buttonlabel",mylabel);
	}
})