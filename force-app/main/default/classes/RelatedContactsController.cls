public with sharing class RelatedContactsController {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getRelatedContacts(String accountId) {
        return [SELECT Name, Email,AccountId,OwnerId FROM Contact WHERE AccountId = :accountId];
    }
}