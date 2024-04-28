public with sharing class FileDemo {
   @AuraEnabled(cacheable=true)
    public static List<Contact> getAccountDataToExport(){
        List<Contact> lstContacts = [SELECT Id, FirstName, LastName, Email 
FROM Contact LIMIT 10];
        return lstContacts;
    }
}