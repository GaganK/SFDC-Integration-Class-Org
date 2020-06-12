@isTest
public class Rest_Test_One {
	@isTest
    static void testMe(){
        MyTest_Data md =new MyTest_Data();
        Test.setMock(HttpCalloutMock.class, md);
		Http_Test_One ht =new Http_Test_One();
        ht.callMe();
        Integer acc =[select count() from Account where name='Satish Rest API' ];
        System.assertEquals(acc,1);
    }
}