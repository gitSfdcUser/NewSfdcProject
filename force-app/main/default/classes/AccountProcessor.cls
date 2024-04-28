public class AccountProcessor implements Database.Batchable<sObject>{
    public Integer recordsProcessed = 0;
    public Database.QueryLocator start(Database.BatchableContext dbc){
        return Database.getQueryLocator([SELECT ID,Name,Count__c, (SELECT ID,LastName FROM Contacts) FROM Account ]);
    }
    public void execute(Database.BatchableContext dbc,List<Account>accList){
        List<Contact> ConList =new List<Contact>();
        for(Account acc: acclist){
            for(Contact con: acc.contacts){
                recordsProcessed++;  
            }
            acc.Count__c = recordsProcessed ;
        } update accList;
    }
    public void finish(Database.BatchableContext dbc){
        System.debug('Your work is done,Sir');
        System.debug('Total Record>>>>' + recordsProcessed);
    }
}