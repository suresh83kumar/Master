({
	hideseek : function(component, event, helper) {
		var myvar = component.find("text");
        console.log(myvar);
        $A.util.toggleClass(myvar,"toggle");
	}
})