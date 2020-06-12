@RestResource(urlmapping='/newOpty/*')
global class Rest_Example_2 {
	@HttpPost
    global static String createOpty(String name,String type){
        System.JSONGenerator js=JSON.createGenerator(true);
        js.writeStartObject();
        try{
            Opportunity op =new Opportunity();
            op.Name=name;
            op.Type=type;
            op.CloseDate=System.today()+15;
            op.stageName='Prospecting';
            insert op;
            js.writeStringField('Status','Success');
            js.writeIDField('Id',op.Id);
            
        }catch(Exception e){
            js.writeStringField('Status','Failed');
            js.writeStringField('Error',e.getMessage());
        }
        js.writeEndObject();
        String result=js.getAsString();
        return result;
    }
}