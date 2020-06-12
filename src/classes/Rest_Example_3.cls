@RestResource(urlmapping='/getAccounts/*')
global class Rest_Example_3 {
	@HttpGet
    global static string callMe(){
    	//String id = RestContext.request.params.get('name');
        RestRequest request=RestContext.request;
        Map<String,String> params=request.params;
        String name=params.get('name');
        String rating=params.get('rating');
        String query='select id,Name,Phone from Account where name like \''+name+'%\' and rating=\''+rating+'\'';
        List<Account> accounts =Database.query(query);
        System.JSONGenerator js=JSON.createGenerator(true);
        js.writeStartObject();
        js.writeNumberField('Count',accounts.size());
        js.writeFieldName('Accounts');
        js.writeStartArray();
        for(Account a: accounts){
            js.writeStartObject();
            	js.writeStringField('Name',a.name);
            	js.writeStringField('Phone',a.phone);
            js.writeEndObject();
        }
        js.writeEndArray();
        js.writeEndObject();
        String result=js.getAsString();
        return result;		
    }
}