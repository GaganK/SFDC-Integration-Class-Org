@isTest
public class SOAP_Test_1 {
	@isTest
    static void testMe(){
       
        String result=SOAP_Example_2.callMe('Myla','Satish');
        System.assertEquals('SatishMyla',result);
    }
}