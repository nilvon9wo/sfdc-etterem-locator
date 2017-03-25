public class SObjectIdHelper {
    public SObjectIdHelper.SObjectId getIdFor(String sObjectType, Id recordId) {
    	if (sObjectType == 'Account') {
    		return new AccountId(recordId);
    	} else if (sObjectType == 'Contact') {
    		return new ContactId(recordId);
    	}
    	throw new SObjectIdHelperException('Unsupported SObjectType: ' + sObjectType);  
    }
    
    public virtual class SObjectId {
    	public Id id {get; private set;}
    	public SObjectId(Id id){
    		this.id = id;
    	}
    }
    
    public class AccountId extends SObjectId {
    	public AccountId(Id id){
    		super(id);
    	}
    }
    
    public class ContactId extends SObjectId  {
    	public ContactId(Id id){
    		super(id);
    	}
    }
}