public class DB_AccountSelector {
	public Account selectById(Id accountId) {
		return [
			SELECT billingStreet, billingCity, billingState
			FROM Account
			WHERE id = :accountId
		];
	}   
}