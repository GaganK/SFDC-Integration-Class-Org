public class JSON_Example_1 {
    public Lead newLead		{set;get;}
    public String result	{set;get;}
    public JSON_Example_1(){
        newLead =new Lead();
    }
    public void create(){
        // JSONGenerator: 
        // 1. This is a pre-defined apex class.
        // 2. This is defined under the namespace of system
        // 3. This class contains all the methods required to generate the JSONString
        System.JSONGenerator js =JSON.createGenerator(true); // true : Pretty Print Format
        // Every JSON String is in the form of object 
        js.writeStartObject();
        js.writeFieldName('Status');
        try{
           insert newLead;
           js.writeString('Success');
           js.writeStringField('Operation','Insert');
           js.WriteIdField('Id',newLead.Id);
           js.writeDateField('CreatedDate',System.today());
        }catch(Exception e){
           js.writeString('Failed'); 
           js.writeStringField('Error',e.getMessage());
        }
        js.writeEndObject();
        // Convert the object into jsonString 
        result=js.getAsString();
    }
    
}