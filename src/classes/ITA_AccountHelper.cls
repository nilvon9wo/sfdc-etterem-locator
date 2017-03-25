public class ITA_AccountHelper implements ProvidesLocation {
	DB_AccountSelector accountSelector;
	 
	public ITA_AccountHelper(DB_AccountSelector accountSelector) {
		this.accountSelector = accountSelector;
	}

	public ITA_AccountHelper() {
		this(new DB_AccountSelector()); 
	}

	public String selectLocation(Id accountId) {
		Account account = this.accountSelector.selectById(accountId);
		return account.billingStreet + ', '
			+ account.billingCity + ', '
			+ account.billingState;
	}
}