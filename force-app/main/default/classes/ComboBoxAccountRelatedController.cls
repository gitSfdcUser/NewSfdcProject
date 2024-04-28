public class ComboBoxAccountRelatedController {
    @AuraEnabled
    public static list<Account>getAccounList(){
        List<Account> AccountList =[Select id,name from Account];
        System.debug('AccountList>>'+AccountList);
        return AccountList;
    }
    //This method will return the value of contact related to account
    @AuraEnabled
    public static list<Contact>getConList(string selectedAccountId){
        List<Contact> ConList =[Select id,Email,Name,AccountId from Contact where AccountId =: selectedAccountId];
        System.debug('AccountList>>'+ConList);
        return ConList;
    }
    
     //This method will return the value of Oppoortunity related to account
    @AuraEnabled
    public static list<Opportunity>getOppList(string selectedAccountId){
        List<Opportunity> OppList =[Select id,Name,AccountId from Opportunity where AccountId =: selectedAccountId];
        System.debug('AccountList>>'+OppList);
        return OppList;
    }
    
    
    
    
}