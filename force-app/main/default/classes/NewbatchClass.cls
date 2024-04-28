public class NewbatchClass implements  Database.Batchable<sObject> {
public Database.QueryLocator start(Database.BatchableContext dbc) {
        return Database.getQueryLocator([select id,name from opportunity Limit 5]);
}
    public void execute(Database.BatchableContext dbc,List<Opportunity>oppList){
        
        
       List<opportunity> NewOppList = new List<opportunity>();
        for(Opportunity op: oppList){
             Opportunity Opp = new Opportunity();
            opp.StageName = 'Closed Won';
                opp.CloseDate = system.today();
            opp.Name = 'Training Batch';
            NewOppList.add(opp);
        }
        insert NewOppList;
    }
    public void finish(Database.BatchableContext dbc){
  
    }

}