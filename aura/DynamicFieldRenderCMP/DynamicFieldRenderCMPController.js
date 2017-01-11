({
	doInit : function(component, event, helper) {
		helper.initialize(component,event);
	},
    onSingleSelectChange : function(component, event, helper) {
		helper.onSingleSelectChange(component);
	},
    onMultiSelectChange : function(component, event, helper) {
		helper.onMultiSelectChange(component);
	},
    onChange : function(component, event, helper) {
		helper.onChange(component);
	},
})