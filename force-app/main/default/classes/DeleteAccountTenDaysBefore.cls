public class DeleteAccountTenDaysBefore implements Database.Batchable<sObject>,Schedulable {
    public Database.QueryLocator Start(Database.BatchableContext dbc){
        return Database.getQueryLocator([SELECT Id,name FROM Account WHERE CreatedDate = LAST_N_DAYS:10]);
    }
    public void execute(Database.BatchableContext dbc, List<account>accList){
        delete accList;
    }
    public void finish(Database.BatchableContext dbc){
        System.debug('done');
         // Get the ID of the AsyncApexJob representing this batch job
   // from Database.BatchableContext.
   // Query the AsyncApexJob object to retrieve the current job's information.
  
    }
   
    public void execute(SchedulableContext sc){
        DeleteAccountTenDaysBefore DelAccTenDAys = new DeleteAccountTenDaysBefore();
        Database.executeBatch(DelAccTenDAys);
    }

}