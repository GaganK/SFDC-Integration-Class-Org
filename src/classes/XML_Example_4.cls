public class XML_Example_4 {
    public Blob body		{set;get;}
    public String result 	{set;get;}
    public void search(){
        String xmlString=body.toString();
        Dom.Document doc=new Dom.Document();
        doc.load(xmlString);
        Dom.XMLNode root =doc.getRootElement();
        result=''+root.getName();
        List<Dom.XMLNode> childs =root.getChildElements();
        for(Dom.XMLNode c:childs){
            List<Dom.XMLNode> subChilds=c.getChildElements();
            if(subChilds.size()>0){
                for(Dom.XMLNode sc:subChilds){
                    result=result+'\n'+sc.getName()+' : '+sc.getText();
                }
            }else{
                result=result+'\n'+c.getName()+' : '+c.getText();
            }
        }
        body=null;
    }
}