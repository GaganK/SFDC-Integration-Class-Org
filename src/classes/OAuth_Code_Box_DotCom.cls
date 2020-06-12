public class OAuth_Code_Box_DotCom {
    public String clientId 		{set;get;}
    public String clientSecret 	{set;get;}
    public String redirectUrl	{set;get;}
    public String code			{set;get;}
    public String accessToken	{set;get;}
    public String state			{set;get;}
    public String result		{set;get;}
    public OAuth_Code_Box_DotCom(){
        redirectUrl='https://ap4.salesforce.com/apex/BoxCode';
    }
    // Request the code 
    public PageReference requestCode(){
        String url='https://account.box.com/api/oauth2/authorize?response_type=code&client_id='+clientId;
        url=url+'&redirect_uri='+redirectUrl+'&state='+state;
        PageReference p=new PageReference(url);
        return p;
    }
    public void readCode(){
        code =Apexpages.currentPage().getParameters().get('code');
    }
    public void requestToken(){
        Http p=new Http();
        String url='https://api.box.com/oauth2/token';
        String body='grant_type=authorization_code';
        body=body+'&code='+code;
        body=body+'&client_id='+clientId;
        body=body+'&client_secret='+clientSecret;
        HttpRequest request =new HttpRequest();
        request.setEndpoint(url);
        request.setMethod('POST');
        request.setBody(body);
      	HttpResponse response =p.send(request);
        String jsonBody=response.getBody();
        System.JSONParser js =JSON.createParser(jsonBody);
        while(js.nextToken()!=null){
            if(js.getText()=='access_token'){
                js.nextToken();
                accessToken=js.getText();
            }
        }
        createFolder();
    }
    public void  createFolder(){
        Http p=new Http();
        HttpRequest request =new HttpRequest();
        request.setEndPoint('https://api.box.com/2.0/folders');
        request.setMethod('POST');
        String body='{"name":"Integration", "parent": {"id": "60562413386"}}';
        request.setBody(body);
        request.setHeader('Authorization','Bearer '+accessToken);
        HttpResponse response=p.send(request);
        result=response.getBody();
    }
}