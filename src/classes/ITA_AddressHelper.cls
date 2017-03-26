public class ITA_AddressHelper {
 
	private static Map<SObjectType, Type> locationProviderByIdTypeMap = new Map<SObjectType, Type>{
		Account.sObjectType => ITA_AccountHelper.class,
		Contact.sObjectType => ITA_ContactHelper.class
	}; 

    public String getAddress (Id id) {
    	if (id == null) {
    		throw new ITA_AddressHelperException('sObject Id required.');	
    	}
    	
    	Type locationProviderType = locationProviderByIdTypeMap.get(id.getSObjectType());
    	ProvidesLocation locationProvider = (ProvidesLocation) locationProviderType.newInstance();
    	if (locationProvider != null){
    		return locationProvider.selectLocation(id);
    	} else {
    		throw new ITA_AddressHelperException('Unsupported SObject Id Type.');	
    	}
    } 
} 