public class Amazon_Example {
    public String name			{set;get;}
    public Integer age			{set;get;}
    public String country		{set;get;}
    public String occupation	{set;get;}
    public String username		{set;get;}
    public String password		{set;get;}
    public String result		{set;get;}
    public Integer userId		{set;get;}
    public void create(){
        
        // Create a Header Element
        Amazon_Service.header_element head =new Amazon_Service.header_element();
        head.userid=userName;
        head.password=password;
        // Create a Person 
       Amazon_Service.Person person=new Amazon_Service.Person();
       person.age=age;
       person.name=name;
       person.country=country;
       person.occupation=occupation;
       // Invoke the service 
      Amazon_Service.PersonServiceSoap11 ap=new Amazon_Service.PersonServiceSoap11();
        // Assign the head object to PersonHeader element in PersonServiceSoap
        ap.personHeader=head; 
        Amazon_Service.addPersonResponse_element response=ap.addPerson(person);
        result=response.message;
    }
    public void getData(){
        Amazon_Service.Login login=new Amazon_Service.Login();
        login.name=name;
        login.password=password;
        Amazon_Service.PersonServiceSoap11 ap=new Amazon_Service.PersonServiceSoap11();
        Amazon_Service.getPersonResponse_element person=ap.getPerson(login,userId);
        System.debug('=====>>>>'+person);
        Amazon_Service.Person p=person.getPersonReturn;
        //Amazon_Service.Person getPersonReturn;
        name=p.name;
        age=p.age;
        occupation=p.occupation;
        country=p.country;
            
    }
}