global class SOAP_Example_2 {
    webservice static String callMe(String lastName,String firstName){
        String name=firstName+lastname;
        return name;
    }
}