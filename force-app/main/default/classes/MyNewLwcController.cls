public with sharing class MyNewLwcController {
    @AuraEnabled(cacheable = true)
    public static list<account> AccountController(){
        try {
            return[Select id,name,Industry,DemoPic__c from account limit 5];
 
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    
   @AuraEnabled(cacheable=true)
public static List<Account> AccountController2() {
    try {
        return [SELECT Id, Name, Industry,DemoPic__c FROM Account LIMIT 1];
    } catch (Exception e) {
        throw new AuraHandledException(e.getMessage());
    }
}

   
}