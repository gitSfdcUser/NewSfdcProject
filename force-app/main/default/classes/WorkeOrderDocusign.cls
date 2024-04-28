public class WorkeOrderDocusign {
    @InvocableMethod(label='DocusignEmail' description='send email')
    public static void sendSingleEmailMethod(List<EmailDetails> emailDetailsList) {
        List<Messaging.SingleEmailMessage> emailsToSend = new List<Messaging.SingleEmailMessage>();
        
        for (EmailDetails details : emailDetailsList) {
            Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
            
            // To Addresses
            String[] toAddresses = new String[] { details.toEmail };
            email.setToAddresses(toAddresses);
            
            // Cc Addresses
            if (!String.isBlank(details.ccEmail)) {
                String[] ccAddresses = details.ccEmail.split(';');
                email.setCcAddresses(ccAddresses);
            }
            
            email.setSubject(details.emailSubject);
            email.setHtmlBody(details.emailBody);
            
            emailsToSend.add(email);
        }
        
        Messaging.sendEmail(emailsToSend);
    }
    
    public class EmailDetails {
        @InvocableVariable(label='To Email' description='Recipient Email Address')
        public String toEmail;
        
        @InvocableVariable(label='Cc Email' description='CC Email Address')
        public String ccEmail;
        
        @InvocableVariable(label='Email Subject' description='Email Subject')
        public String emailSubject;
        
        @InvocableVariable(label='Email Body' description='Email Body')
        public String emailBody;
    }
}