@isTest
private  class ContactHandlerTriggerTest {
    @isTest
    private static void ContactHandlerTriggerTest(){
        //account
        Account acc = new Account();
        acc.name='Ashwiniji';
        acc.Industry = 'Media';
        acc.Rating = 'Hot';
        insert acc;
        //contact
        Contact con = new Contact();
        con.LastName ='Sharmaji';
        con.AccountId = acc.Id;
                insert con;
       
        Account accnNew = [select id,name from Account Where Id =:con.AccountId];
        System.assertEquals(accnNew.Name, acc.name+con.LastName);
    }
@isTest
    private static void ContactHandlerTriggerTestDelete(){
        //account
        Account acc = new Account();
        acc.name='Ashwiniji';
        acc.Industry = 'Media';
        acc.Rating = 'Hot';
        insert acc;
        //contact
        Contact con = new Contact();
        con.LastName ='Sharmaji';
        con.AccountId = acc.Id;
                insert con;
        delete con;
       
        Account accnNew = [select id,name from Account Where Id =:con.AccountId];
        System.assertEquals(accnNew.name, acc.Name);
        
        
    }
    

        
    }