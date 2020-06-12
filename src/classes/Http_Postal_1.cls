public class Http_Postal_1 {
    public String zipCode {Set;get;}
    public String result  {set;get;}
    public string endPoint{set;get;}
    public List<String> places {set;get;}
    public Http_Postal_1(){
        endpoint='http://postalpincode.in/api/pincode/';
        //http://postalpincode.in/api/postoffice/New Delhi
    }
    public void callMe(){
        endpoint=endpoint+zipcode;
        HttpRequest request =new HttpRequest();
        request.setEndpoint(endPoint);
        request.setMethod('GET');
        Http p=new Http();
        HttpResponse response =p.send(request);
        result=response.getBody();
        places =new List<String>();
        System.JSONParser js=JSON.createParser(result);
        while(js.nextToken()!=null){
            if(js.getText()=='Name'){
                js.nextToken();
                places.add(js.getText());
            }
        }
    }
}