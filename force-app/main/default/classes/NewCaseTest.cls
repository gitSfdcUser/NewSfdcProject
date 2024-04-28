@isTest
private class NewCaseTest {
    @isTest
    private static void NewCaseTestMethod(){
        Account acc= new Account();
        acc.name='Ash';
        insert acc;
        Contact con = new Contact();
        con.AccountId =acc.Id;
        con.LastName ='Yuffo';
        insert con;
        Case Cas= new Case();
        Cas.Status= 'New';
        Cas.Origin= 'Phone';
        Cas.AccountId=acc.Id;
        insert Cas;
        NewCase.createMethod();
        Case NewCas = [select id,Status,Origin,AccountId from Case where Id =: Cas.Id];
        System.assertEquals(NewCas.Status,Cas.Status);
        System.assertEquals(NewCas.AccountId,Cas.AccountId);
        System.assertEquals(NewCas.Status ,Cas.Status);
        System.assertEquals(NewCas.Origin, Cas.Origin);
    }
}