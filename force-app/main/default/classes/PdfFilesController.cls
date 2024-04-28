public with sharing class PdfFilesController {
    @AuraEnabled(cacheable=true)
    public static List<ContentDocument> getPdfFiles(Id caseId) {
        List<ContentDocumentLink> contentDocumentLinks = [SELECT ContentDocumentId FROM ContentDocumentLink WHERE LinkedEntityId = :caseId];
        Set<Id> contentDocumentIds = new Set<Id>();
        for (ContentDocumentLink link : contentDocumentLinks) {
            contentDocumentIds.add(link.ContentDocumentId);
        }
        return [SELECT Id, Title, FileType FROM ContentDocument WHERE Id IN :contentDocumentIds AND FileType = 'PDF'];
    }
}