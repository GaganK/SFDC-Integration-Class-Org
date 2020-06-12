@RestResource(urlmapping='/newCustomer/*')
global class Rest_Example_1 {
	@HttpPost
    global static string create(String name,String industry,String phone){
        System.JSONGenerator js=JSON.createGenerator(true);
        js.writeStartObject();
        Integer count=[select count() from Account where name=:name];
        if(count>0){
            js.writeStringField('Status','Failed');
            js.writeStringField('Error','Duplicate Record Found');
        }else{
            try{
                Account acc =new Account();
                acc.Name=name;
                acc.Industry=industry;
                acc.Phone=phone;
                insert acc;
                js.writeStringField('Status','Success');
                js.writeIdField('Id',acc.Id);
            }catch(Exception e){
               js.writeStringField('Status','Failed');
               js.writeStringField('Error',''+e.getCause()); 
            }
        }
        js.writeEndObject();
        String result=js.getAsString();
        return result;
    }
}