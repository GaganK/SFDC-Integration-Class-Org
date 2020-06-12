public class XML_Example_3 {
    public String xmlString  {set;get;}
    public String result	 {set;get;}
    public void fetchData(){
        // Create a document element 
        Dom.Document doc=new Dom.Document();
        // Load the xml string into document
        doc.load(xmlString);
        // Get the root element from the document
        Dom.XMLNode root =doc.getRootElement();
        result=''+root.getName();
        // Get the child Elements 
        List<DOM.XMLNOde> childs =root.getChildElements();
        // Take one by one child Element and get element name and value
        for(DOM.XMLNode c:childs){
            result=result+'\n'+c.getName()+' : '+ c.getText();
        }
    }
}