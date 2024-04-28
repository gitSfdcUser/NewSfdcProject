public class DeleteOldAttachments {
    
    public static void deleteAttachments() {
        // Specify the date threshold for deleting attachments (adjust as needed)
        Date thresholdDate = Date.today().addMonths(-2); // Delete attachments older than 6 months
        
        // Query for attachments to delete
        List<Attachment> attachmentsToDelete = [SELECT Id FROM Attachment WHERE CreatedDate < :thresholdDate];
        System.debug('attachmentsToDelete size>>>>>'+attachmentsToDelete.size());
        // Delete the attachments
        delete attachmentsToDelete;
        System.debug('attachmentsToDelete>>>>>'+attachmentsToDelete);
    }
}