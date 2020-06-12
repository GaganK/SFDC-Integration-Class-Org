@isTest
public class Rest_Test_Two {
	@isTest
    static void testMe(){
        Dummy_Response res=new Dummy_Response();
        Test.setMock(HttpCalloutMock.class,res);
        Http_Test_Two ht =new Http_Test_Two();
        ht.name='Kiran';
        ht.city='Ban';
        String result1=ht.callMe();
        System.assertEquals('Success',result1);
        
        ht.name='';
        ht.city='';
        String result2=ht.callMe();
        System.assertEquals('Failed',result2);
    }
}