public class ITA_AddressHelper {
	ITA_AccountHelper accountHelper;
	ITA_ContactHelper contactHelper;

	public ITA_AddressHelper(ITA_AccountHelper accountHelper, ITA_ContactHelper contactHelper) {
		this.accountHelper = accountHelper;
		this.contactHelper = contactHelper;
	}

	public ITA_AddressHelper() { 
		this(new ITA_AccountHelper(), new ITA_ContactHelper());
	}
    
    public String getAddress (SObjectIdHelper.SObjectId recordId) {
    	if (recordId instanceof SObjectIdHelper.AccountId) {
    		return this.accountHelper.selectLocation(recordId.id);	
    	} else if (recordId instanceof SObjectIdHelper.ContactId) {
    		return this.contactHelper.selectLocation(recordId.id);	
    	}
    	
    	throw new ITA_AddressHelperException('Unsupported SObject Id Type');
    } 
}