public class Http_IP_Trace {
    public String  ipAddress			{set;get;}
    public String  endpoint				{set;get;}
    public String  result				{set;get;}
    public Map<String,Object> resMap	{set;get;}
    public Http_IP_Trace(){
        endpoint='http://xml.utrace.de/?';
    }
    public void invoke(){
        endpoint=endpoint+'query='+ipAddress;
        HttpRequest request =new HttpRequest();
        request.setEndpoint(endpoint);
        request.setMethod('GET');
        Http p=new Http();
        HttpResponse response =p.send(request);
        result=response.getBody();
        resMap=new Map<String,Object>();
        /* Load the xml and create dom.document object.*/
        DOM.Document doc=new DOM.Document();
        doc.load(result);
        DOM.XMLNode root =doc.getRootElement();
        List<Dom.XmlNode> resNode=root.getChildElements();
        List<Dom.XMLNode> childs =resNode[0].getChildElements();
        for(DOM.XMLNode cn :childs){
            resMap.put(cn.getName(),cn.getText());
        }
    }
}