public class InTheArea {   
	ITA_AddressHelper addressHelper; 
	YelpWrapper yelpWrapper;
	 
	public InTheArea(ITA_AddressHelper addressHelper, YelpWrapper yelpWrapper) {
		this.addressHelper = addressHelper;
		this.yelpWrapper = yelpWrapper;
	}
   
	public InTheArea() {
		this(new ITA_AddressHelper(), new YelpWrapper());
	}
	 
	// @return	the list of locations, in JSON. 
	@AuraEnabled
	public static String getListByGeoCoordinates(Decimal latitude, Decimal longitude, String searchTerm) {
		return (new InTheArea()).request(searchTerm, latitude, longitude); 
	}

	// @return	the list of locations, in JSON. 
	@AuraEnabled
	public static String getLocationListForRecord(String recordId, String searchTerm) {
		return (new InTheArea()).request(searchTerm, (Id) recordId);
	}
 
	@testVisible
	private String request(String searchTerm, Decimal latitude, Decimal longitude) { 
		return this.yelpWrapper.request(searchTerm, latitude, longitude); 
	}
 
	@testVisible
	private String request(String searchTerm, Id recordId) {
		try {
			return this.yelpWrapper.request(searchTerm, this.addressHelper.getAddress(recordId));   
		}
		catch (Exception ex) {
			return '{' + 
					'"error" : "This component cannot be used on this page type: ' + ex.getMessage() + '"' 
				+ '}';
		}
	} 
}