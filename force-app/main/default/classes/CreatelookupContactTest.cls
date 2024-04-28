@isTest
Private class CreatelookupContactTest {
    @isTest
    private static void CreatelookupContactTestMethod(){
        Account acc = new account();
        acc.name = 'Shiva';
        insert acc;
        contact con = new contact();
        con.LastName = 'HEllo';
        con.AccountId = acc.id ;
        insert con;
         Contact conNew = [select id,LastName from contact where AccountId =: acc.id Limit 1];
         List<Contact> ResultList = CreateLookupContact.createLookupmthd();
       system.assertEquals(ResultList[0].LastName, conNew.LastName);
       
       
        
    } 
    
}