public with sharing class OptionsMetadataController {
    @AuraEnabled(cacheable=true)
    public static List<Map<String, String>> getOptionsMetadata() {
        List<Map<String, String>> optionsList = new List<Map<String, String>>();
        for (Options_Metadata__mdt metadata : [SELECT Label__c, Value__c FROM Options_Metadata__mdt]) {
            Map<String, String> option = new Map<String, String>();
            option.put('label', metadata.Label__c);
            option.put('value', metadata.Value__c);
            optionsList.add(option);
        }
        return optionsList;
    }
}