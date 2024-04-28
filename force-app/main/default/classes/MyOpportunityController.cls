public class MyOpportunityController {
   public List<Opportunity>OppList{get;set;}
public MyOpportunityController(){
OppList = [select id,name,Stagename from Opportunity limit 100];
}
  public void Test()
    {
        system.debug('************ Selected Names are **********');
        }
}