public with sharing class AccountTriggerHandler {
    public static void handletriggerLogic(List<Account>newList){
    Set<Id> accIdSet = new Set<Id>();

for(Account acc: newList){
if(acc.Dano__Close_all_Opps__c){
    accIdSet.add(acc.Id);
}
}
List<Opportunity> oppList = [Select Id,name,StageName,AccountId FROM Opportunity where AccountId IN : accIdSet];
for(Opportunity opp: oppList){
    opp.StageName = 'Closed Won';
}
if(!oppList.IsEmpty()){
    update oppList;
    System.debug('updated opp:::::'+oppList);
}
    }
}