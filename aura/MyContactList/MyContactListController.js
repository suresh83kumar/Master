({
	myAction : function(component, event, helper) {
		var action = component.get("c.getContacts");
		action.setCallback(this, function(data) {
		component.set("v.contacts", data.getReturnValue());
		});
		$A.enqueueAction(action);

	},
   
    navigate : function(component, event, helper) {
       // var urlEvent = $A.get("e.force:navigateToURL");
    	
    //var urlEvent = $A.get("e.force:navigateToURL");
//window.location('https://mmsapexdoc.accenture.com/excel');
        window.open("https://mmsapexdoc.accenture.com/excel","_blank") 
    }
})