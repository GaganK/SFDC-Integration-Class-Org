public class Schedule_Example implements Schedulable{
    public void execute(SchedulableContext sc){
        Schedule_Example.callMe();
    }
    @future(callout=true)
    public static void callMe(){
        List<Opportunity> scope=[select id,Amount,INR_Value__c from Opportunity where CreatedDate=TODAY];
        String endpoint='http://apilayer.net/api/live?';
        endpoint=endpoint+'access_key=b62a820cfd132fd3358b7c';
        endpoint=endpoint+'&currencies=INR';
        endpoint=endpoint+'&source=USD';
        endpoint=endpoint+'&format=1';
        HttpRequest request =new HttpRequest();
        request.setEndPoint(endpoint);
        request.setMethod('GET');
        Http p=new Http();
        HttpResponse response=p.send(request);
        String result=response.getBody();
        Decimal value;
        System.JSONParser js= JSON.createParser(result);
        while(js.nextToken()!=null){
            if(js.getText()=='USDINR'){
                js.nextToken();
                value =(Decimal)js.getDecimalValue();
            }
        }
        for(Opportunity op:scope){
            op.INR_Value__c='Rs.'+(op.Amount*value);
        }
        update scope;

    }
    
}