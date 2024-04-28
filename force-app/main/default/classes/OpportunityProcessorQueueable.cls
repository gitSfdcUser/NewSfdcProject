public class OpportunityProcessorQueueable implements Queueable{
    public void execute(QueueableContext qc){
        Database.executeBatch(new OpportunityProcessor());
    }
    
}