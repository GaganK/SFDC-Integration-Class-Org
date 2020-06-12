global class INR_Coversion_Batch implements Database.Batchable<sobject>,Database.AllowsCallouts {
    global Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator('select id,Amount,INR_Value__C from Opportunity where CreatedDate=TODAY');
    }
    global void execute(Database.BatchableContext bc,List<Opportunity> scope){
        String endpoint='http://apilayer.net/api/live?';
        endpoint=endpoint+'access_key=b62a820cfdc332fd3358b7c';
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
    global void finish(Database.BatchableContext bc){
        
    } 
}