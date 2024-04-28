public class QueryAllAccount {
    
    public static List<Account> createMethod(){
         List<Account>AccList = new  List<Account>();
        //Creating a List of OpportunityLineItem
        List<OpportunityLineItem> OliList =new List<OpportunityLineItem>();
        
                //Creating a List of Opportunity
 List<Opportunity> OppList =new List<Opportunity>();
        Set<Id> OppIds =new Set<Id>();
        Set<Id>AccIds = new Set<Id>();
  
        //query all OpportunityLineItem;
        OliList=[Select Id,Name,OpportunityId from OpportunityLineItem where OpportunityId!=null];
        //filling oppurtunityId into OppIds
       for(OpportunityLineItem OppLIneItem: OliList ){
            if(OppLIneItem.OpportunityId != null){
                OppIds.add(OppLIneItem.OpportunityId);
            }

       // System.debug('OliList>>>'+OliList);
      //  System.debug('OliList[i].OpportunityId>>>'+OppIds);
        //query all Opportunity 
        OppList=[Select Id,Name,AccountId from Opportunity Where Id =: OppIds];
           for(Opportunity oppor: OppList){
               if(oppor.AccountId!=null){
                   accIds.add(oppor.AccountId);
               }
           }
        //system.debug(OppList);
        AccList=[Select id,name from account where id=: accIds];
          
       System.debug(AccList);
    }
        return AccList;
        
}
}