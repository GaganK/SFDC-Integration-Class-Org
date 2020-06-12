@isTest
public class MyTest_Data implements HttpCalloutMock {
    public HTTPResponse respond(HTTPRequest req){
        String endpoint=req.getEndpoint();
        System.assertEquals(endpoint,'https://www.satishmyla.in/student');
        String method=req.getMethod();
        System.assertEquals('GET',method);
        HttpResponse response=new HttpResponse();
        response.setBody('Satish Rest API');
        return response;
    }
}