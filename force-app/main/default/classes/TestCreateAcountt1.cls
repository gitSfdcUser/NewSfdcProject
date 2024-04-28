@isTest
public class TestCreateAcountt1 {
    @isTest
    private static void testAccount(){
        Account a = new Account();
        a.name='shivam';
        a.AccountNumber='1234567890091';
        a.Industry='biotechnology';
        a.Ownership='Public';
        a.Type='Prospect';
        insert a;
        CreateAccountt1.createmethod();
        Account NewAccount =[select id,name,AccountNumber,Industry,Ownership,Type from Account where Id =: a.Id];
        System.assertEquals('shivam', NewAccount.name);
        System.assertEquals('1234567890091',NewAccount.AccountNumber);
    }
}