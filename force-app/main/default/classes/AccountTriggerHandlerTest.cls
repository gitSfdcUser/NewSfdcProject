@isTest
public class AccountTriggerHandlerTest {
    @isTest
    private static void UpdateRatingTest(){
        Account acc = new Account();
        acc.name='Ashwini';
        acc.Industry = 'Media';
        acc.Rating = 'Hot';
        insert acc;
        
        Account acco= new Account();
        acco.Name='Rishi';
        acco.rating='Cold';
        acco.industry='Communication';
        insert acco;
        
        Account Accno=[select id,name,industry,Rating from Account where Id =: acco.id Limit 1];
        Account accn = [select id,name,industry,Rating from Account where name = 'Ashwini' Limit 1];
        system.assertEquals(acc.Rating, accn.Rating);
        system.assertEquals(accno.Rating,acco.Rating);
        accn.Phone ='2345654';
        accn.Description='Phone is updated on account';
        update accn;
        Account accnn=[select id,name,Phone,description from Account Limit 1];
        System.assertEquals(accnn.phone, accn.Phone);
        
    }
    @isTest
    private static void CreateRelatedRecordTest(){
        Account acc = new Account();
        acc.name='Ashwini';
        acc.Industry = 'Media';
        acc.Rating = 'Hot';
        acc.Phone='385949404050';
        
        insert acc;
        
        opportunity opp= new opportunity();
        opp.name=acc.Name;
        opp.AccountId=acc.Id;
        opp.StageName='Prospecting';
        opp.CloseDate=System.today();
        insert opp;
        if(acc.Phone != null){
            opp.Account_Phone__c=acc.phone;
            update opp;
            Opportunity oppn = [select id,name,Account_Phone__c from opportunity where Id =:opp.id];
            system.assertEquals(oppn.Account_Phone__c,opp.Account_Phone__c);
        }
    }
}