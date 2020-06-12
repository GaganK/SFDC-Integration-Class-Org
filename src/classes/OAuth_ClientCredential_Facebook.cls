public class OAuth_ClientCredential_Facebook {
    public void callMe(){
        
        String ClientId,clientSecret,redirectUrl;
        clientId='2184183518498675';
        clientSecret='4604cd98dc74ef3b8c95364dcfe21ec7';
        redirectUrl='https://ap4.salesforce.com/apexrest/FacebookLogin';
        String endpoint='https://graph.facebook.com/oauth/access_token?client_id='+clientId;
        endpoint=endpoint+'&client_secret='+clientSecret;
  		endpoint=endpoint+'&redirect_uri='+redirecturl;
  		endpoint=endpoint+'&grant_type=client_credentials';
        Http p=new Http();
        HttpRequest request =new HttpRequest();
        request.setEndPoint(endpoint);
        request.setMethod('GET');
        HttpResponse response=p.send(request);
        String body=response.getBody();
        System.debug(body);
    }
}