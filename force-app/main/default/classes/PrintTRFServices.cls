public class PrintTRFServices {
    @AuraEnabled
    public static List<String> createTRF(Integer trfCount) {
        // Query ContentVersion records based on ContentDocumentIds
        List<ContentVersion> contentVersions = [SELECT VersionData FROM ContentVersion WHERE ContentDocumentId IN (SELECT Id FROM ContentDocument WHERE Id = '0695g00000JsIIFAA3')];
        
        List<String> contentStrings = new List<String>();
        
        // Convert content to base64 encoded strings
        for (ContentVersion version : contentVersions) {
            if (version.VersionData != null) {
                contentStrings.add(EncodingUtil.base64Encode(version.VersionData));
            } else {
                // Handle null VersionData
                contentStrings.add('No content available');
            }
        }
        System.debug('contentStrings'+contentStrings);
        return contentStrings;
    }
}