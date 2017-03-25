public class YelpWrapper {
	private static final String SEARCH_URL = 'https://th-yelp-locator.herokuapp.com/search';

	Http http;
	 
	public YelpWrapper(Http http) {
		this.http = http;
	}
	
	public YelpWrapper() {
		this(new Http());
	}
	
    public String request(String searchTerm, Decimal latitude, Decimal longitude) {
    	return this.sendRequest(searchTerm, latitude + ',' + longitude);
    }

    public String request(String searchTerm, String address) {
    	return this.sendRequest(searchTerm, EncodingUtil.urlEncode(address, 'UTF-8'));
    }
    
    @testVisible
    private String sendRequest (String searchTerm, String sanitizedLocation) {
		HttpRequest request = new HttpRequest();
		request.setMethod('GET');
		request.setEndpoint(
			SEARCH_URL 
				+ '?address=' + sanitizedLocation     	
				+ '&term=' + EncodingUtil.urlEncode(searchTerm, 'UTF-8')
		);

		try {
			return this.http.send(request).getBody();
		}
		catch (Exception ex) {
			return '{"error": "' + ex.getMessage() + '"';
		}
    }


}