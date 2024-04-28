public class queryAllAccount2 {
    public static List<Account> createMethod(){
        //Creating a Map of Id And OpportunityLineItem
        Map<Id,list<OpportunityLineItem>> MapIds =new   Map<Id,list<OpportunityLineItem>>();
        //creating a set of id
        Set<Id> AccIds = new  Set<Id>();
       // iteratig a loop Andfilling values i Map
        for(Opportunity Opp : [SELECT Id,Name,AccountId ,
                               (SELECT Id,quantity FROM OpportunityLineItems )  
                               FROM Opportunity ]){
            MapIds.put(Opp.AccountId,Opp.OpportunityLineItems); 
            
        }
        for( Id  Ids :MapIds.KeySet() ){
            if(MapIds.get(Ids).size()>0){
                AccIds.add(Ids);
            }
        }
        system.debug('22@@@@@@'+AccIds);
        List<Account> accList = [select id,name from Account where Id IN : AccIds];
        System.debug(accList);
        return accList;
    }
}