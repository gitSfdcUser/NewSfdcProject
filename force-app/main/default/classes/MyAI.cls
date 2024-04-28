public class MyAI {
  /*  public static void SendEmail(){
        List<Dano__EmailAI__c > requestList = [Select Id,name,Dano__toMail__c,Dano__Subject__c,Dano__textBody__c,Dano__recordId__c	 from Dano__EmailAI__c Limit 1];
    
        
        
        Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
            message.toAddresses = new String[] {requestList[0].Dano__toMail__c};
                
                message.optOutPolicy = 'FILTER';
            message.subject = requestList[0].Dano__Subject__c	;
                                   
                                   
            //message.setReplyTo(replyTo);
                                   
          //  message.ccAddresses = new String[] {ccMail};
                message.plainTextBody = requestList[0].Dano__textBody__c	;
            //message.setSaveAsActivity(true);
            message.setWhatId(requestList[0].Dano__recordId__c);
           // system.debug('@@@@@@@@ :: '+DocumentIds.size());
            
                       // system.debug('DocumentIds:: '+DocumentIds);

           // if(DocumentIds.size()>0){
                                                         //   System.debug('I am here_________');

               // List<Attachment> files = [SELECT Name, Body, ContentType FROM Attachment WHERE Id IN :DocumentIds];

                List<Messaging.EmailFileAttachment> attachments = new List<Messaging.EmailFileAttachment>();
             /*   for (Attachment file: files) {
                    Messaging.EmailFileAttachment efa = new Messaging.EmailFileAttachment();
                    efa.setFileName(file.Name);
                    efa.setBody(file.Body);
                    efa.setContentType(file.ContentType);
                    attachments.add(efa);
                                            system.debug('DocumentIds:: ');

                    addAttachment = true;
                                                                system.debug('addAttachment1st:: '+addAttachment);

                message.setFileAttachments(attachments);
                message.setTreatTargetObjectAsRecipient(true);
           // }
           }*/
            
        /*    Messaging.SingleEmailMessage[] messages =   new List<Messaging.SingleEmailMessage> {message};
                Messaging.SendEmailResult[] results = Messaging.sendEmail(messages);
            if (results[0].success){
                
                System.debug('The email was sent successfully.');
                //
                     
                
                //
     
                //
                
               /* if(addAttachment == true){
                    CreatedDate = system.Datetime.now();
                                    System.debug('CreatedDate>>>>>'+CreatedDate);
                    
                                    System.debug('DocumentIds[0]>>>>>'+DocumentIds[0]);

                    addAttachmentToEmailActivity(recordId,DocumentIds[0],CreatedDate);
                }
*/
           /* } else {
                System.debug('The email failed to send: ' + results[0].errors[0].message);
            }
        
}
*/
}