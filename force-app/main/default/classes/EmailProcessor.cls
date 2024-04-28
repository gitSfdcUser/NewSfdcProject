public class EmailProcessor {

    public static void processEmail(String emailBody, Dano__wake_up__c applicationRecord) {
        // Check if email body contains 'Approved' or 'Rejected'
        if (emailBody.contains('Approved')) {
            handleApproval(applicationRecord);
        } else if (emailBody.contains('Rejected')) {
            handleRejection(applicationRecord);
        } else {
            handleDefaultCase(applicationRecord);
        }
    }

    private static void handleApproval(Dano__wake_up__c applicationRecord) {
        // Update application status to 'Approved'
        applicationRecord.Status__c = 'Approved';
        updateRecord(applicationRecord);

        // Notify Back Office about the approval
        notifyBackOffice('Application Approved', applicationRecord);
    }

    private static void handleRejection(Dano__wake_up__c applicationRecord) {
        // Update application status to 'Rejected'
        applicationRecord.Status__c = 'Rejected';
        updateRecord(applicationRecord);

        // Notify Back Office about the rejection
        notifyBackOffice('Application Rejected', applicationRecord);
    }

    private static void handleDefaultCase(Dano__wake_up__c applicationRecord) {
        // Handle any additional logic for the default case
        // For example, log an error, update status to 'Pending', etc.
        applicationRecord.Status__c = 'Pending';
        updateRecord(applicationRecord);
    }

    private static void updateRecord(Dano__wake_up__c applicationRecord) {
        // Perform DML operation to update the record
        try {
            update applicationRecord;
        } catch (Exception e) {
            System.debug('Error updating record: ' + e.getMessage());
            // Handle the exception as needed
        }
    }

    private static void notifyBackOffice(String message, Dano__wake_up__c applicationRecord) {
        // Logic to send notification to Back Office
        // This can be through email, platform notifications, etc.
        // For simplicity, let's just print a debug message here
        System.debug('Back Office Notification: ' + message);
        System.debug('Application Details: ' + applicationRecord);
    }
}