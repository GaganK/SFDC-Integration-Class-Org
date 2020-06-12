public class Http_Test_One {
    public void callMe(){
        Http p=new Http();
        HttpRequest request =new HttpRequest();
        request.setEndpoint('https://www.satishmyla.in/student');
        request.setMethod('GET');
        HttpResponse response =p.send(request);
        String body=response.getBody();
        Account acc =new Account();
        acc.Name=body;
        acc.Industry='Banking';
        insert acc;
    }
}