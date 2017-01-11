({
	copyText : function(component, event, helper) {

        var messageEvent = component.getEvent("PhoneNumberEvent");
        var cpytxt = component.get("v.phone");
        console.log("Setting Values as"+cpytxt);
        messageEvent.setParams({
            "phone": cpytxt
        });
         console.log("New --> Setting Values as"+cpytxt);
        messageEvent.fire();
        
        
       // var cpytxt = component.get("v.phone");
       
        
        //$A.get("e.c:PhoneNumberEvent").setParams({"phone":cpytxt}).fire();
	}
})