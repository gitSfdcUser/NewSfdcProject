@isTest
private class DelcontTest {
    @isTest
    private static void DelcontTest(){
        Account acc = new account();
        acc.Name = 'Avish';
        acc.phone = '83429384938';
        insert acc;
        contact con = new  contact();
        con.LastName = 'taami';
        con.AccountId =acc.id;
        insert con;
         Contact Delcon = [select account.name from contact where account.name like '%a%' Limit 1];
        List<contact> Result = Delcont.deletemethod();
         
      System.assertEquals(Delcon, null);
        
    }
    
    @isTest
    private static void DelcontXTest(){
        Account acc = new account();
        acc.Name = 'Avish';
        acc.phone = '83429384938';
        insert acc;
        contact con = new  contact();
        con.LastName = 'taami';
        con.AccountId =acc.id;
        insert con;
        Contact Delcon = [select account.name from contact where account.name like '%a%' Limit 1];
        List<contact> Result = DelcontX.deletemethod();
         
  
        
    }
    
}