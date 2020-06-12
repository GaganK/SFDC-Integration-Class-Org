public class OAuth_UserName_SF_SF {
    public String clientId          {set;get;}
    public String clientSecret      {set;get;}
    public String userName          {set;get;}
    public String password          {set;get;}
    public String name              {set;get;}
    public String url               {set;get;}
    public String endPoint          {set;get;}
    public String accessToken       {set;get;}
    public String result            {set;get;}
    public OAuth_UserName_SF_SF(){
        url='https://login.salesforce.com/services/oauth2/token';
        endPoint='https://ap4.salesforce.com/services/apexrest/newOpty';
    }
    public void requestToken(){
        Http p=new Http();
        HttpRequest request =new HttpRequest();
        request.setEndpoint(url);
        request.setMethod('POST');
        String body='grant_type=password';
        body=body+'&client_id='+clientId;
        body=body+'&client_secret='+clientSecret;
        body=body+'&username='+username;
        body=body+'&password='+password;
        request.setBody(body);
        HttpResponse response=p.send(request);
        String jsonResult=response.getBody();
        /* De-serialize the response and fetch the accesstoken */
        System.JSONParser jp=JSON.createParser(jsonResult);
        while(jp.nextToken()!=null){
            if(jp.getText()=='access_token'){
                jp.nextToken();
                accessToken=jp.getText();
            }
        }
        create();
    }
    public void create(){
        Http p=new Http();
        HttpRequest request =new HttpRequest();
        request.setEndPoint(endpoint);
        request.setHeader('Content-type','application/json');
        request.setMethod('POST');
        String body='{"name":"Integration123","type":"New Customer"}';
        request.setHeader('Authorization','OAuth '+accesstoken);
        request.setBody(body);
        HttpResponse response=p.send(request);
        result=response.getBody();
    }
}