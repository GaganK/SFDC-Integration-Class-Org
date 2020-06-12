public class OAuth_LinkedIn_Code {
    public String clientId		{set;get;}
    public String clientSecret	{set;get;}
    public string redirectUrl	{set;get;}
    public String code			{set;get;}
    public String accessToken	{set;get;}
    public String codeUrl		{set;get;}
    public String accessUrl		{set;get;}
    public String endpoint		{set;get;}
    public String result		{set;get;}
    public OAuth_LinkedIn_Code(){
        codeUrl='https://www.linkedin.com/oauth/v2/authorization';
        accessurl='https://www.linkedin.com/oauth/v2/accessToken';
        redirectUrl='https://ap4.salesforce.com/apex/Linked_Response';
    }
    public PageReference requestCode(){
        codeUrl=codeUrl+'?response_type=code';
        codeurl=codeUrl+'&client_id='+clientId;
        codeUrl=codeUrl+'&redirect_uri='+redirectUrl;
        codeUrl=codeUrl+'&state=Testing';
        PageReference  p=new PageReference(codeUrl);
        return p;
    }
    public void readCode(){
        code =Apexpages.currentPage().getParameters().get('code');
    }
    public void requestToken(){
        Http p=new Http();
        HttpRequest request =new HttpRequest();
        request.setEndPoint(accessUrl);
        request.setMethod('POST');
        String body='grant_type=authorization_code';
        body=body+'&code='+code;
        body=body+'&redirect_uri='+redirectUrl;
        body=body+'&client_id='+clientId;
        body=body+'&client_secret='+clientSecret;
        request.setBody(body);
        HttpResponse response =p.send(request);
        String jsonResult=response.getBody();
        System.JSONParser js=JSON.createParser(jsonResult);
        while(js.nextToken()!=null){
            if(js.getText()=='access_token'){
                js.nextToken();
                accessToken=js.getText();
            }
        }
        fetchData();
    }
    public void fetchData(){
        Http p=new Http();
        HttpRequest request =new HttpRequest();
        request.setEndpoint('https://api.linkedin.com//v1/people/~');
        request.setMethod('GET');
        request.setHeader('Authorization','Bearer '+accessToken);
        HttpResponse response =p.send(request);
        result=response.getBody();
       
    }
}