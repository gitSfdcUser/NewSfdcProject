public class RemindLeasProcessor implements Schedulable {
    public void execute(SchedulableContext sc){
        Database.executeBatch(new LeadProcessor());
    }
}