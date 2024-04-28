public with sharing class CustomLookUpPageController {
        
        public string accLAstName{set;get;}
        
        public void insertacc(){
            Contact acc=new Contact();
            acc.LAstName = accLAstName;
            if (acc.LAstName == null || acc.LAstName == ''){
                ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Please enter Account Name__'));
            }
            if (acc.LAstName != null && acc.LAstName != ''){
                ApexPages.addmessage(new ApexPages.message(ApexPages.severity.CONFIRM,'Record insert successfully'));
            }
            
            insert acc;   
            
        }
        public pagereference LookUp(){
            pagereference redirect = new PageReference('/apex/CustomLookUpPageCombo');
            
            redirect.setRedirect(true);
            system.debug('Hello@@'+redirect);
            return redirect;
        }
    }