({
	doInit : function(component, event, helper) {
		var main = component.find('main');
		$A.util.removeClass(main, 'small');
		$A.util.addClass(main, component.get('v.designHeight'));

		if (component.get('v.recordId')) {
			helper.getLocationList(component, helper);	 
		} else {
			helper.positionStyleEnhancements(component);
			helper.setPosition(component, helper);
		}
	},
    
    showDetails: function(component, event, helper) {
		helper.closeItem(component.get('v.openItem'));
		helper.openItem(component, event.currentTarget);
	},    
    
	updateSearch : function(component, event, helper) {
		helper.getLocationList(component, helper);
	}    
})