public class LeadProcessor implements Database.Batchable<sObject>, Database.Stateful {
    public Database.QueryLocator start(Database.BatchableContext dbc) {
        return Database.getQueryLocator([SELECT Id,name FROM Lead WHERE Phone = NULL And CreatedDate = YESTERDAY]);
    }
    public void execute(Database.BatchableContext dbc,List<Lead>leads){
     
    }
    public void finish (Database.BatchableContext dbc) {
        System.debug('done');
// Get the ID of the AsyncApexJob representing this batch job
// from Database.BatchableContext.
// Query the AsyncApexJob object to retrieve the current job's information.
AsyncApexJob a = [SELECT Id, Status, NumberOfErrors, JobItemsProcessed,
TotalJobItems, CreatedBy.Email
FROM AsyncApexJob WHERE Id =: dbc.getJobId()];
// Send an email to the Apex job's submitter notifying of job completion.
Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
String[] toAddresses = new String[] {a.CreatedBy.Email};
mail.setToAddresses(toAddresses);
mail.setSubject('Apex Sharing Recalculation ' + a.Status);
mail.setPlainTextBody
('The batch Apex job processed ' + a.TotalJobItems +
' batches with '+ a.NumberOfErrors + ' failures.');
Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
}
}