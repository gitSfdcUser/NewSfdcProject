public with sharing class CleansingWasteDataBatch implements Database.Batchable<sObject>{
public Database.QueryLocator start(Database.BatchableContext bc){
// collect data here 
string query = 'Select Id,Name From Account Where Name != null';
return Database.getQueryLocator(query);

}
public void execute(Database.BatchableContext bc,List<Account>scope){
// process data here 
for(account acc: scope){
System.debug('acc Name:::::::::'+acc.Name);
}
}
public void finish(Database.BatchableContext bc){
    // do post work here 
    System.debug('Data Cleans Up Bro:::::::::\n chill Its finished:::::::');

}
}