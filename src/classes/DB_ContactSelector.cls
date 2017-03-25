public class DB_ContactSelector {
	public Contact selectById(Id contactId) {
		return [
			SELECT mailingStreet, mailingCity, mailingState
			FROM Contact
			WHERE id = :contactId
		];
	}   
}