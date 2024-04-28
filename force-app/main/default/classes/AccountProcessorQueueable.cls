public class AccountProcessorQueueable implements Queueable {
    public void execute(QueueableContext qc){
        Database.executeBatch(new AccountProcessor());
    }
}