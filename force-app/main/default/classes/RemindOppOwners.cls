global  class RemindOppOwners implements Schedulable  {
    global void execute(SchedulableContext ctx){
        List<Opportunity>OppList = [select id,name,closedate from Opportunity where isClosed =False And CloseDate<Today];
        TaskUtils.RemindOppOwners(OppList);
    }
}