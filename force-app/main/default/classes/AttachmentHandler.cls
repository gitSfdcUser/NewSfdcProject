public class AttachmentHandler {
    
    // Define a method to retrieve attachment content and convert to text
    public static List<AttachmentWrapper> retrieveAttachmentsAsText(Set<Id> contentDocumentIds) {
        List<AttachmentWrapper> attachmentWrappers = new List<AttachmentWrapper>();
        
        // Query ContentVersion to retrieve document data
        List<ContentVersion> contentVersions = [SELECT Id, Title, FileType, VersionData 
                                                FROM ContentVersion 
                                                WHERE ContentDocumentId IN :contentDocumentIds];
        
        // Process each ContentVersion record
        for (ContentVersion version : contentVersions) {
            AttachmentWrapper attachmentWrapper = new AttachmentWrapper();
            attachmentWrapper.attachmentId = version.Id;
            attachmentWrapper.title = version.Title;
            attachmentWrapper.fileType = version.FileType;
            
            // Convert content to text if needed
            if (version.FileType == 'text/plain' || version.FileType == 'application/pdf' || version.FileType == 'text/html') {
                attachmentWrapper.textContent = version.VersionData != null ? version.VersionData.toString() : '';
System.debug('attachmentWrapper.textContent ::::'+attachmentWrapper.textContent );
            }
            
            attachmentWrappers.add(attachmentWrapper);
        }
        System.debug('attachmentWrappers::::::');
        return attachmentWrappers;
    }
    
    // Wrapper class for attachment details
    public class AttachmentWrapper {
        public Id attachmentId { get; set; }
        public String title { get; set; }
        public String fileType { get; set; }
        public String textContent { get; set; }
    }
}