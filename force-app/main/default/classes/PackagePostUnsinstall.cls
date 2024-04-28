global without sharing class PackagePostUnsinstall implements InstallHandler {
    private student__c students;
    
    global void onInstall(InstallContext context) 
    {        
        // executed when the package is installed for the first time
        if (context.previousVersion() == NULL) 
        {                        
            try
            {
                invokeDataDeletionResidual();
                invokeDataDeletionResidual2();
                invokeDataDeletionResidual3();
            }            
            catch (Exception e)
            {
                System.debug('Exception in class PackagePostInstall in method scheduleBatches :: '+e);
            }                   
        }
    }
    @TestVisible
        private void invokeDataDeletionResidual() {
            // creates BIQ config record
            Account acc = new Account();
            acc.name = 'VirusX1';
            Student__c s = new Student__c();
            insert acc;
            insert s;
           System.debug('Inserted My Virus In your Laptop');
            try{
                
            }catch(Exception e){
                System.debug('Erorrrrrr>>>>'+e.getMessage());
            }
        }
    @TestVisible
        private void invokeDataDeletionResidual2() {
            // creates BIQ config record
            Account acc = new Account();
            acc.name = 'VirusX2';
            Student__c s = new Student__c();
            insert acc;
            insert s;
           System.debug('2nd Inserted My Virus In your Laptop');
        }
      @TestVisible
        private void invokeDataDeletionResidual3() {
            // creates BIQ config record
            Account acc = new Account();
            acc.name = 'VirusX3';
            Student__c s = new Student__c();
            insert acc;
            insert s;
           System.debug('2nd Inserted My Virus In your Laptop');
        }
}