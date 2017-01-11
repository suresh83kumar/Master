({
    handleClick : function(cmp, event) {
        var attributeValue = cmp.get("v.text");
        console.log("current text: " + attributeValue);

        var target;
        if (event.getSource) {
            // handling a framework component event
            target = event.getSource(); // this is a Component object
            console.log("event.getSource(): " + event.getSource);
            cmp.set("v.text", target.get("v.label"));
        } else {
            // handling a native browser event
            target = event.target.value; // this is a DOM element
            console.log("event.target.value: " + event);
            cmp.set("v.text", event.target.value);
        }
    }
})