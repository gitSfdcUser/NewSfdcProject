@RestResource(urlMapping='/submitcaseandfile/*')
global with sharing class CaseAndFileUploadAPI {

    @HttpPost
    global static String submitCaseAndFile(String caseSubject, String caseDescription, String fileName, String fileContent, String fileContentType) {
        // Step 1: Create the case record
        Case newCase = new Case(
            Subject = caseSubject,
            Description = caseDescription,
            Status = 'New',
            Origin = 'Web'
        );
        insert newCase;
        
        // Step 2: Create the ContentVersion record for the file
        ContentVersion newContentVersion = new ContentVersion(
            Title = fileName,
            PathOnClient = fileName,
            VersionData = EncodingUtil.base64Decode(fileContent),
            FirstPublishLocationId = newCase.Id
        );
        insert newContentVersion;
        String ContentDocumentId = [SELECT ContentDocumentId FROM ContentVersion WHERE Id = :newContentVersion.Id].ContentDocumentId;

        
        // Step 3: Create the Attachment record
        Attachment newAttachment = new Attachment(
            ParentId = newCase.Id,
            Name = fileName,
            ContentType = fileContentType,
               Body = EncodingUtil.base64Decode('documentId')
        );
        insert newAttachment;
        
        return newCase.Id;
    }
}