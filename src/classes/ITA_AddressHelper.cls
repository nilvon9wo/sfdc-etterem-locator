public class ITA_AddressHelper {
	ClassHelper classHelper; 
	ITA_AccountHelper accountHelper;
	ITA_ContactHelper contactHelper;

	private Map<String, ProvidesLocation> locationProviderByIdTypeMap; 

	public ITA_AddressHelper(ClassHelper classHelper, ITA_AccountHelper accountHelper, ITA_ContactHelper contactHelper) {
		this.classHelper = classHelper;
		this.accountHelper = accountHelper;
		this.contactHelper = contactHelper;
		
		locationProviderByIdTypeMap = new Map<String, ProvidesLocation>{
			'AccountId' => accountHelper,
			'ContactId' => contactHelper
		};
	}

	public ITA_AddressHelper() { 
		this(new ClassHelper(), new ITA_AccountHelper(), new ITA_ContactHelper());
	}
    
    public String getAddress (SObjectIdHelper.SObjectId recordId) {
    	String idType = classHelper.getNameFor(recordId);
    	ProvidesLocation locationProvider = locationProviderByIdTypeMap.get(idType);
    	if (locationProvider != null){
    		return locationProvider.selectLocation(recordId.id);
    	} else {
    		throw new ITA_AddressHelperException('Unsupported SObject Id Type');	
    	}
    } 
}