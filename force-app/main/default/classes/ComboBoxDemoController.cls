public class ComboBoxDemoController {
 @AuraEnabled
    public static list<Account>getAccounList(){
        List<Account> AccountList =[Select id,name from Account];
        System.debug('AccountList>>'+AccountList);
        return AccountList;
    }
    
    
    
}