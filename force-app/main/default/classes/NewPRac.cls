public with sharing  class NewPRac {
    private ApexPages.StandardController stdCtrl;
    public NewPRac(Apexpages.StandardController controller){
        stdCtrl=controller;
       
    }
    public void AccountSelected(){
        
       Contact cs = (Contact)  stdCtrl.getRecord();
        if(!String.isBlank(cs.AccountId))
        {
            cs.Account= [select id,name,website,phone From Account Where Id =: cs.AccountId];
        }
        else
        {
            cs.Account=null;
        }
    }
}