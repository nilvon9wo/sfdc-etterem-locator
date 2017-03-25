public class InTheArea {   
	ITA_AddressHelper addressHelper;
	SObjectIdHelper sObjectIdHelper;
	YelpWrapper yelpWrapper;
	 
	public InTheArea(ITA_AddressHelper addressHelper, SObjectIdHelper sObjectIdHelper, YelpWrapper yelpWrapper) {
		this.addressHelper = addressHelper;
		this.sObjectIdHelper = sObjectIdHelper;
		this.yelpWrapper = yelpWrapper;
	}
 
	public InTheArea() {
		this(new ITA_AddressHelper(), new SObjectIdHelper(), new YelpWrapper());
	}
	
	@AuraEnabled
	// @return	the list of locations, in JSON. 
	public static String getListByGeoCoordinates(String searchTerm, Decimal latitude, Decimal longitude) {
		return (new InTheArea()).request(searchTerm, latitude, longitude); 
	}

	@AuraEnabled
	// @return	the list of locations, in JSON. 
	public static String getListForRecord(String searchTerm, String sObjectType, String recordId) {
		return (new InTheArea()).request(searchTerm, sObjectType, (Id) recordId);
	}
 
	@testVisible
	private String request(String searchTerm, Decimal latitude, Decimal longitude) { 
		return this.yelpWrapper.request(searchTerm, latitude, longitude); 
	}
 
	@testVisible
	private String request(String searchTerm, String sObjectType, Id recordId) {
		try {
			SObjectIdHelper.SObjectId typedId = this.sObjectIdHelper.getIdFor(sObjectType, recordId);
			return this.yelpWrapper.request(searchTerm, this.addressHelper.getAddress(typedId));   
		}
		catch (Exception ex) {
			return '{' + 
					'"error" : "This component cannot be used on this page type: ' + ex.getMessage() + '"' 
				+ '}';
		}
	} 
}