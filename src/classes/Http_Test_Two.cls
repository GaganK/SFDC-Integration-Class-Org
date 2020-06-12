public class Http_Test_Two {
    public String name;
    public String city;
    public String callMe(){
        Student std =new Student();
        std.Name=name;
        std.city=city;
        Http p=new Http();
        HttpRequest request =new HttpRequest();
        request.setEndpoint('https://myStudent.com/test');
        request.setMethod('POST');
        String body=JSON.serialize(std);
        request.setBody(body);
        HttpResponse response =p.send(request);
        String result=response.getBody();
        return result;
    }
}