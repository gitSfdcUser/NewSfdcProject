public class LeadProcessorSchedular implements Schedulable {
    public void execute(SchedulableContext sc){
        Database.executeBatch(new LeadProcessor());
    }
    }