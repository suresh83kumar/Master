({
    send : function(component, event, helper) {
        var text = event.source.get("v.label");
        $A.get("e.c:LC_ClientSideController_Event").setParams({
            text: text
       }).fire();
    }
})