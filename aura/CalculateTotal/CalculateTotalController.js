({
	calculate : function(component, event, helper) {
		var input1 = component.find("inputOne").get("v.value");
        var input2 = component.find("inputTwo").get("v.value");
        var input3 = component.find("inputThree").get("v.value");
        console.log(input1+' '+input2+' '+input3);
        var finalval = (parseInt(input1) + parseInt(input2)) - parseInt(input3);
        console.log(finalval);
        var finaltag = component.find("totalValue").set("v.value",finalval);
	}
})