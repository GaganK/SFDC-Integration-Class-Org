public class XML_Example_1 {
    public String xmlString {set;get;}
    public XML_Example_1(){
        Dom.Document doc =new Dom.Document();
        // Dom.XmlNode root =doc.createRootElement('Student','https://satishmyla.in','capital');
        // Create a root element student 
        Dom.XMLNode root =doc.createRootElement('Student',null,null);
        
        // Add child Element name under student
        Dom.XMLNode name =root.addChildElement('Name',null,null);
        
        // Under the name add child Element lastName and add value Myla 
        Dom.XMLNode lname=name.addChildElement('LastName',null,null);
        lname.addTextNode('Myla');
        lname.addCommentNode('This is employees surname');
        
        // Under the name add child Element firstName and add value satish
        Dom.XMLNode fname =name.addChildElement('FirstName',null,null);
        fname.addTextNode('Satish');
        
        //Under the student add College and add value CBIT 
        DOM.XMLNode colg =root.addChildElement('College',null,null);
        colg.addTextNode('CBIT');
        xmlString =doc.toXmlString();
    }
}