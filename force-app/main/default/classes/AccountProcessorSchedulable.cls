public class AccountProcessorSchedulable implements Schedulable {
    public void execute(SchedulableContext sc){
        System.enqueueJob(new AccountProcessorQueueable());
         CronTrigger ct = [SELECT TimesTriggered, NextFireTime FROM CronTrigger WHERE Id = :sc.getTriggerId()];
    }
   
}