public class DeleteAccountTenDaysBeforeScheduler {
    public void execute(SchedulableContext sc){
        DeleteAccountTenDaysBefore DelAccTenDAys = new DeleteAccountTenDaysBefore();
        Database.executeBatch(DelAccTenDAys);
    }

}