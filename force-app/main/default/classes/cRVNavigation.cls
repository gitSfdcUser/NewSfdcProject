public class cRVNavigation {
    @AuraEnabled
    public static account cRVNavigationMethod(){
        account acc = new account();
        acc.name = 'TesterXwz';
       // insert acc;
  system.debug('acc>>>'+acc);
        return acc;
 
    }
}