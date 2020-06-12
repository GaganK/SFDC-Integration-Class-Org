public class JSON_Example_2 {
    public String jsonString    {set;get;}
    public JSON_Example_2(){
        List<Account> accounts =[select id,Name,Phone,Industry from Account limit 5];
        System.JSONGenerator js=JSON.createGenerator(true);
        Integer count =accounts.size();
        if(count> 0){
            js.writeStartObject();
                js.writeStringField('Status','Success');        
                js.writeNumberField('Count',count);
                js.writeFieldName('Accounts');
                js.writeStartArray();
                for(Account a : accounts){ 
                        js.writeStartObject();
                            js.writeStringField('Name',a.name);
                            js.writeStringField('Phone',a.phone);
                            js.writeStringField('Industry',a.Industry);
                        js.writeEndObject();
                    }
                js.writeEndArray();
            
            js.writeEndObject();
            jsonString=js.getAsString();
        }
    }
}