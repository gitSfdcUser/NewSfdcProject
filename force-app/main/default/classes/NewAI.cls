public class NewAI {
    public static void SendEmail1(){
        List<Dano__EmailAI__c > requestList = [Select Id,name,Dano__toMail__c,Dano__Subject__c,Dano__textBody__c,Dano__recordId__c,Dano__Full_Format__c,Dano__website__c	 from Dano__EmailAI__c Limit 1];
        
        Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
        // Set recipients to two contact IDs.
        // Replace IDs with valid record IDs in your org.
        //New Enhancement
        
        
        
        String NewW = requestList[0].Dano__toMail__c;
        List<String> parts = NewW.split(',');
        System.debug('parts>>>>'+parts);
        
        message.toAddresses = parts;
        message.optOutPolicy = 'FILTER';
        message.subject = requestList[0].Dano__Subject__c	;
       // message.plainTextBody = requestList[0].Dano__textBody__c	;
       
message.setHtmlBody(requestList[0].Dano__Full_Format__c+ ' '+requestList[0].Dano__website__c);



        Messaging.SingleEmailMessage[] messages = 
            new List<Messaging.SingleEmailMessage> {message};
                
                Messaging.SendEmailResult[] results = Messaging.sendEmail(messages);
        if (results[0].success) {
            System.debug('The email was sent successfully.');
        } else {
            System.debug('The email failed to send: '
                         + results[0].errors[0].message);
        }
    }
}