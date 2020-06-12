public class Http_Currency_Converter {
    public String endPoint 	{set;get;}
    public String source	{set;get;}
    public String target	{set;get;}
    public String key		{set;get;}
    public Decimal value	{set;get;}
    public Http_Currency_Converter(){
        endpoint=' ?';
    }
    public void invoke(){
        endpoint=endpoint+'access_key='+key;
        endpoint=endpoint+'&currencies='+target;
        endpoint=endpoint+'&source='+source;
        endpoint=endpoint+'&format=1';
        HttpRequest request =new HttpRequest();
        request.setEndPoint(endpoint);
        request.setMethod('GET');
        Http p=new Http();
        HttpResponse response=p.send(request);
        String result=response.getBody();
        System.JSONParser js= JSON.createParser(result);
        while(js.nextToken()!=null){
            if(js.getText()=='USDINR'){
                js.nextToken();
                value =(Decimal)js.getDecimalValue();
            }
        }
    }
}