({
	closeItem: function(currentItem) {
	/*
		if (currentItem) {
			var itemDetails = currentItem.querySelector('[data-details]');
			$A.util.addClass(itemDetails, 'slds-hide');
		}
	*/		
	}, 

    doLayout: function(component, response) {
    /*
    	$A.util.addClass(component.find('spinner'), 'slds-hide');

        var warning = component.find('warning');
        var responseValue = (JSON.parse(response.getReturnValue()));
        if (responseValue.error) { 
    		component.set('v.errorMessage', responseValue.error);
    		$A.util.removeClass(warning, 'slds-hide');    	
        } else {
	        var restaurantList = responseValue.bizArray;
        	$A.util.addClass(warning, 'slds-hide');
        	component.set('v.restaurantList', restaurantList);
        }
	*/        
    },

    getLocationList: function(component, helper) {
		/*
    	$A.util.removeClass(component.find('spinner'), 'slds-hide');
    	var searchTerm = helper.selectSearchTerm(component);
		
		var action = this.getLocationListForRecord(component, searchTerm);
        //var action = component.get('v.recordId')
        //		? this.getLocationListForRecord(component)
		// 		: this.getLocationListForPosition(component);


        action.setCallback(this, function(response) {
            this.doLayout(component, response);
        });

        $A.enqueueAction(action);
		*/
    },

    getLocationListForPosition: function(component, searchTerm) {
    /*
    	var coordinates = component.get("v.location").coords;
        var action = component.get('c.getListByGeoCoordinates');
       	action.setParams({
       		latitude = coordinates.latitude,
       		longitude = coordinates.longitude,
            searchTerm: searchTerm;
        });
		return action;
	*/		    	
    },
    
    getLocationListForRecord: function(component, searchTerm) {
    /*
        var action = component.get('c.getListForRecord');
       	action.setParams({
            recordId: component.get('v.recordId'),
            searchTerm: searchTerm,
            sObjectType: component.get('v.sObjectName')
        });
		return action;
	*/    	
    }, 

    openItem: function(component, selectedItem) {
    /*
		component.set('v.openItem', selectedItem);
		var itemDetails = selectedItem.querySelector('[data-details]');
		$A.util.removeClass(itemDetails, 'slds-hide');
	*/		
    },

    positionStyleEnhancements: function(component) {
    /*
			$A.util.addClass(component.find('main'), 'autoHeight');
			var scrollableArea = component.find('scrollableArea');
			$A.util.removeClass(scrollableArea, 'scroll-container');
			$A.util.removeClass(scrollableArea, 'slds-scrollable-y');
	*/			
    },
    
    selectSearchTerm: function (component) {
    /*
        var searchTerm = component.find('searchTerm').get('v.value');
        return searchTerm
        	? searchTerm
        	: component.get('v.defaultSearch');
	*/        	
    },

	setPosition: function(component, helper) {
	/*
		$A.util.removeClass(component.find('spinner'), 'slds-hide');
		navigator.geolocation.getCurrentPosition(handleCurrentPosition, handleError);
		
		function handleCurrentPosition(location) {
			component.set('v.location', location);
		}
		
		function handleError() {
			component.set('v.errorMessage', 'Could not get your current geolocation.');
			$A.util.removeClass(component.find('warning'), 'slds-hide');
		}
	*/		
	}
})