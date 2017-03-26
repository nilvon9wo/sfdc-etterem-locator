public class ITA_ContactHelper implements ProvidesLocation {
	DB_ContactSelector contactSelector;
	
	public ITA_ContactHelper(DB_ContactSelector contactSelector) {
		this.contactSelector = contactSelector;
	}

	public ITA_ContactHelper() {
		this(new DB_ContactSelector());
	}
	
	public String selectLocation(Id contactId) {
		Contact contact = this.contactSelector.selectById(contactId); 
		return contact.mailingStreet + ', '
			+ contact.mailingCity + ', '
			+ contact.mailingState;
	}    
}