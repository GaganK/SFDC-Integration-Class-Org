public class Chatter_Rest_Example {
	Public string result{set;get;}
	Public string Status{set;get;}
	Public Integer StatusCode{set;get;}
	Public String PostComment{set;get;}
  	Public void getdata(){
      Http p=new Http();
      HttpRequest request=new HttpRequest();
      request.setEndpoint('https://ap4.salesforce.com/services/data/v29.0/chatter/feeds/record/me/feed-items');
      request.setMethod('GET');
      request.setHeader('Authorization' ,'OAuth '+ UserInfo.getSessionId());
      HttpResponse response =p.send(request);
      result=response.getBody();
  }
  
  public Void post(){
     string pbody='Force.com';
     string postbody='{"body":{"messageSegments":[{"type":"Text","text":"'+pbody +'"}]}}';
     Http p= new Http();
     HttpRequest request =new HttpRequest();
     request.setEndpoint('https://ap4.salesforce.com/services/data/v29.0/chatter/feeds/record/me/feed-items');
     request.setHeader('Authorization' ,'OAuth '+ userinfo.getsessionid());
     request.setMethod('POST');
      //Req.setbody('{"body":{"messageSegments":[{"type":"Text","text":"New comment"}]}}');
     request.setBody(postbody);
     request.setHeader ('Content-Type','application/json');
     HttpResponse response= p.send(request); 
     result=response.getBody();
     statusCode=response.getStatusCode();
      status=response.getStatus();
    }
    
    
    Public Void PostComment()
    {
    
         PostComment ='cloud+computing';

        Http P= New Http();
        
        HttpRequest Req= New HttpRequest();
        Req.setendpoint('https://ap2.salesforce.com/services/data/v29.0/chatter/feed-items/0D52800000045zACAQ/comments?text='+postcomment);
         Req.setheader('Authorization' ,'OAuth '+ userinfo.getsessionid());
         Req.setmethod('POST');
         
         Httpresponse Res= New Httpresponse();
         
         Res=p.send(Req);
         
          Statuscode=Res.getstatuscode();
      Status= Res.getstatus();  
         
    
    }
}