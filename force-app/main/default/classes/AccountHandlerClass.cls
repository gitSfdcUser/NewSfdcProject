public class AccountHandlerClass {
    public static void UpdateRating(List<account>newList){
        
        for(account acc:newList){
            if(acc.Industry!=null && acc.Industry=='Media'){
                acc.Rating='Hot';
            }else
                acc.Rating='Cold';
            
        }
    }
    public static void CreateRelatedRecord(List<account>newList){
        List<opportunity>OpptoBeInserted= new List<opportunity>();
        for(account acc: newList){
            opportunity opp= new opportunity();
            opp.name=acc.Name;
            opp.AccountId=acc.Id;
            opp.StageName='Prospecting';
            opp.CloseDate=System.today();
            OpptoBeInserted.add(opp);
        }
        if(!OpptoBeInserted.isEmpty()){
            insert OpptoBeInserted;
        }
        
    } 
    public static void UpdatePhoneDescription(List<account>newList ,Map<Id,account> oldMap){
        for(account acc: newList)
            if(oldMap!= null && acc.Phone!=oldMap.get(acc.Id).phone){
                acc.description='Phone is updated on account';
            }
    }
    public static void updateRelatedOppPhone(List<account>newList, Map<Id,Account> oldMap){
        Map<Id,Account> accIdToAccountMap = new Map<Id,Account>();
        List<Opportunity>OppToBeUpdated = new List<Opportunity>();
        
        for(account acc: newList){
            if(oldMap!=null && acc.Phone!=oldMAp.get(acc.Id).Phone){
                accIdToAccountMap.put(acc.id,acc);
            }
        }
        
        for(Opportunity opp: [select id,Account_Phone__c,AccountId from Opportunity Where AccountId IN :accIdToAccountMap.keySet()]){
            
            Opportunity oppor = new Opportunity();
            if(accIdToAccountMap.containsKey(Opp.AccountId)){
                oppor.id=Opp.Id;
                oppor.Account_Phone__c= accIdToAccountMap.get(opp.AccountId).Phone;
                OppToBeUpdated.add(oppor);
            }
        }
        
        if(!OppToBeUpdated.isEmpty()){
            update OppToBeUpdated;
        }
        
    }
}