public with sharing class myControllerExtension {
    
    public string accName{set;get;}
    
    public void insertacc(){
        account acc=new account();
        acc.Name = accName;
        if (acc.Name == null || acc.Name == ''){
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Please enter Account Name__'+acc.name));
        }
        if (acc.Name != null && acc.Name != ''){
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.CONFIRM,'Record insert successfully'));
        }
        
        insert acc;   
        
    }
    public pagereference DisplayError(){
        pagereference redirect = new PageReference('/apex/AccountErrorPageComboNEw');
        
        redirect.setRedirect(true);
        system.debug('Hello@@'+redirect);
        return redirect;
    }
}