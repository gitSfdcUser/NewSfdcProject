public class AccountSummaryController {
    public List< Account>accList{get;set;}
     public  List<AggregateResult>OppResult{get;set;}
    public Decimal Result{get;set;}
    public List< Opportunity>oppList{get;set;}
    
    
    public AccountSummaryController(){
        accList = [select id,name from  Account limit 10];
      List<AggregateResult>OppResult= [select Count(AccountId)Counter From Opportunity];
        
        
    }
    public void Test()
    {
        system.debug('************ Selected Names are **********');
    }
}