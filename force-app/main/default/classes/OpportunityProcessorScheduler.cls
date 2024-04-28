public class OpportunityProcessorScheduler implements Schedulable {
    public void execute(SchedulableContext sc){
        System.enqueueJob(new OpportunityProcessorQueueable());
    }
}