public class EmailTemplateSender {
    public void sendEmailWithTemplate(String recipientEmail, String templateId, String targetObjectId) {
String EmailTemplateId =[Select id from EmailTemplate where name =:templateId limit 1].Id;
        System.debug('EmailTemplateId>>'+EmailTemplateId);
        // Create an instance of Messaging.SingleEmailMessage
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();

        // Set the recipient's email address
        email.setToAddresses(new String[]{recipientEmail});

        // Set the email template ID
        email.setTemplateId(EmailTemplateId);

        // Set the targetObjectId
        email.setTargetObjectId(targetObjectId);
        email.saveAsActivity = false;

        // Send the email
        Messaging.SendEmailResult[] results = Messaging.sendEmail(new Messaging.SingleEmailMessage[]{email});

        // Check the results
        if (results[0].isSuccess()) {
            System.debug('Email sent successfully.');
        } else {
            System.debug('Email sending failed. Error: ' + results[0].getErrors()[0].getMessage());
        }
    }
}