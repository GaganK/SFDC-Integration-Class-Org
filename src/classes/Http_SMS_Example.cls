public class Http_SMS_Example {
    @future(callout=true)
    public static void afterInsert(Set<Id> accIds){
        List<Account> accounts =[select Id,Phone from Account where Id in: accIds];
        String numbers;
        for(Account a: accounts){
            if(numbers=='' || numbers==null){
               numbers=a.phone; 
            }else{
                numbers=numbers+','+a.phone;
            } 
        }
        Http p=new Http();
        HttpRequest request =new HttpRequest();
        String endpoint='https://api.textlocal.in/send/?';
        endpoint=endpoint+'apiKey=OeC4fhA/SJ8-Z7yFHr2YaI7';
        endpoint=endpoint+'&numbers='+numbers;
        endpoint=endpoint+'&sender=TXTLCL';
        endpoint=endpoint+'&message=Your Account is registered Successfully';
        request.setEndpoint(endpoint);
        request.setMethod('GET');
        HttpResponse response=p.send(request);
        String body=response.getBody();
        System.debug('Status :'+response.getStatus());
        System.debug('Status Code:'+response.getStatusCode());
        System.debug('Body:'+body);
    }
}