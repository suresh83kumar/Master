({
	validatenum : function(component, event, helper) {
		var mycmp = component.find("inputCmp");
        var nu=mycmp.get("v.value");
        if(isNaN(nu)){
            mycmp.set("v.errors",[{message:"Enter only numbers in this field"}]);
        } else {
            mycmp.set("v.errors",null);
        }
	}
})