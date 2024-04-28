public class EventAccountProcessorScheduler implements Schedulable {
 public void execute(SchedulableContext sc){
        System.enqueueJob(new  EventAccountProcessor());
 }
}