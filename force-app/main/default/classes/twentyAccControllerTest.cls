@isTest
public class twentyAccControllerTest {
@isTest
    public static void twentyAccControllerTestmethod(){
        List<Account>Acclist =  TestDataFactory.CreateAccData(20);
      
        test.startTest();
        NewWork.CreateAccount();
           test.stopTest();
    }
}