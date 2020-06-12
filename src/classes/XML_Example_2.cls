public class XML_Example_2 {
    public String xmlString {set;get;}
    public XML_Example_2(){
        List<Account> accounts =[select id,name,industry from Account limit 4];
        Dom.Document doc =new Dom.Document();
        // Create a root element accounts
        Dom.XMLNode root =doc.createRootElement('Accounts',null,null);
        for(Account a: accounts){
            // Take one by one account and add them as child to the accounts 
            Dom.XMLNode acc=root.addChildElement('Account',null,null);
            // Set name and industry as attribute 
            acc.setAttribute('Name',a.Name);
            acc.setAttribute('Industry',a.Industry);
        }
        xmlString =doc.toXmlString();
    }
}