public class JSON_Example_3 {
    public String jsonString {set;get;}
    public JSON_Example_3(){
        List<Account> accounts =[select id,Name,(select phone from Contacts) from Account limit 3];
        System.JSONGenerator js=JSON.createGenerator(true);
        js.writeStartObject();
        js.writeFieldName('Accounts');
        js.writeStartArray();
        	for(Account a: accounts){
            	js.writeStartObject();
                	js.writeStringField('Name',a.name);
                	js.writeFieldName('Phones');
                    js.writeStartArray();
                	for(Contact c:a.contacts){
                        if(c.phone!=null){
                            js.writeString(c.phone);
                        }
                	}
                	js.writeEndArray();
                js.writeEndObject();
        	}
        js.writeEndArray();
        js.writeEndObject();
        jsonString=js.getAsString();
    }
}