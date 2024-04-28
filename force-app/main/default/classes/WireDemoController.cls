public class WireDemoController {
 @AuraEnabled(cacheable=true)
    public static list<Account>getAccounList(){
        List<Account> AccountList =[Select id,name from Account];
        System.debug('AccountList>>'+AccountList);
        return AccountList;
    }
    
    
    
}