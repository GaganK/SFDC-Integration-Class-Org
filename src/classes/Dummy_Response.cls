@isTest
public class Dummy_Response implements HttpCalloutMock {
    public HttpResponse respond(HttpRequest request){
        String result;
        String endpoint= request.getEndpoint();
        String method=request.getMethod();
        System.assertEquals('https://myStudent.com/test',endpoint);
        System.assertEquals('POST',method);
        String body=request.getBody();
        Student std =(Student)JSON.deserialize(body,student.class);
        if(std.name!=''&&std.city!=''){
            result='Success';
        }else{
            result='Failed';
        }
        HttpResponse response =new HttpResponse();
        response.setBody(result);
        return response;
    }
}