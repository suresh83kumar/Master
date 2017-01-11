({
	add : function(component) {
		var sum = component.get("v.n1") + component.get("v.n2");
        component.set("v.sum",sum);
        component.set("v.edit",false);
        component.set("v.Browswer", $A.get("$Browser.formFactor"))
        var dayofweek = $A.get("$Locale.labelForToday");
        alert(dayofweek);
        //component.set("v.DayoftheWeek", dayofweek)
	},
    
    generateNumbers : function(component){
    	var numb=[];
    	for(var i=0;i<10;i++){
            numb.push(i);
		}
        component.set("v.mynumbers",numb);
	}
})