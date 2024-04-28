public class AccountExtensionsPage {
private final account acct;
    public AccountExtensionsPage(ApexPages.StandardController stdController){
        this.acct = (Account)stdcontroller.getRecord();
    }
    public String getGreeting(){
        return 'Hello'+ acct.name +  '('+acct.id +')';
    }        
    }