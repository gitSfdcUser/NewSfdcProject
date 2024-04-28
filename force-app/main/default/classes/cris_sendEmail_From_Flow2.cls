public class cris_sendEmail_From_Flow2 {
    
    @InvocableMethod(label='Cris Send Email' description ='Send Email From Flow' category='cris_Registry__c')
    Public static void sendEmailUsingFlow(List<emailRequests> requestList){
        
        String toMail = '';
        String ccMail = '';
        String replyTo = '';
        String textBody ='';
        String recordId = '';
        String subject = '';
        Datetime CreatedDate ;
        boolean addAttachment = false;
        List<String> DocumentIds = new List<String>();
        if(requestList.size()>0){
            if(requestList[0].toMail != null)
                toMail = requestList.get(0).toMail;
            if(requestList[0].ccMail != null)
                ccMail = requestList.get(0).ccMail;
            if(requestList[0].ReplyTo != null)
                replyTo = requestList.get(0).ReplyTo;
            if(requestList[0].TextBody != null)
                textBody = requestList.get(0).TextBody;
            if(requestList[0].RecordId != null)
                recordId = requestList.get(0).RecordId;
            if(requestList[0].Subject != null)
                subject = requestList.get(0).Subject;
            if(requestList[0].DocumentIds.size()>0)
                DocumentIds = requestList.get(0).DocumentIds;
            system.debug('@@@@@@@@ :: '+DocumentIds.size());
            
            Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
            message.toAddresses = new String[] {toMail};
                message.optOutPolicy = 'FILTER';
            message.subject = subject;
            message.setReplyTo(replyTo);
            message.ccAddresses = new String[] {ccMail};
                message.plainTextBody = textBody;
            message.setSaveAsActivity(true);
            message.setWhatId(recordId);
            system.debug('@@@@@@@@ :: '+DocumentIds.size());
            
                        system.debug('DocumentIds:: '+DocumentIds);

            if(DocumentIds.size()>0){
                                                            System.debug('I am here_________');

                List<Attachment> files = [SELECT Name, Body, ContentType FROM Attachment WHERE Id IN :DocumentIds];
                                                                            System.debug('I am here___file______'+files);

                List<Messaging.EmailFileAttachment> attachments = new List<Messaging.EmailFileAttachment>();
                for (Attachment file: files) {
                    Messaging.EmailFileAttachment efa = new Messaging.EmailFileAttachment();
                    efa.setFileName(file.Name);
                    efa.setBody(file.Body);
                    efa.setContentType(file.ContentType);
                    attachments.add(efa);
                                            system.debug('DocumentIds:: ');

                    addAttachment = true;
                                                                system.debug('addAttachment1st:: '+addAttachment);

                }
                message.setFileAttachments(attachments);
                message.setTreatTargetObjectAsRecipient(true);
            }
            
            Messaging.SingleEmailMessage[] messages =   new List<Messaging.SingleEmailMessage> {message};
                Messaging.SendEmailResult[] results = Messaging.sendEmail(messages);
            if (results[0].success){
                
                System.debug('The email was sent successfully.');
                //
                     
                
                //
                Task t = new Task();
t.Subject = 'Outbound Email Task';
t.Status = 'Completed';
t.Description = 'Outbound Email Task for email message';
                t.WhatId = requestList[0].recordId; // Related Object Id

//t.WhoId = '0031700001R0G4hAAF';
t.ActivityDate = system.today();
insert t;
                //
                System.debug('addAttachment>>>>>'+addAttachment);
                
                if(addAttachment == true){
                    CreatedDate = system.Datetime.now();
                                    System.debug('CreatedDate>>>>>'+CreatedDate);
                    
                                    System.debug('DocumentIds[0]>>>>>'+DocumentIds[0]);

                    addAttachmentToEmailActivity(recordId,DocumentIds[0],CreatedDate);
                }
            } else {
                System.debug('The email failed to send: ' + results[0].errors[0].message);
            }
        }
    }
    
    @future
    public static void addAttachmentToEmailActivity(String recordId, String AttachmentId, Datetime CreatedDate){   
        Id messageId = [Select Id  From EmailMessage Where RelatedToId =: recordId And CreatedDate =: CreatedDate].Id;
        List<Attachment> files = New List<Attachment>();
        for(Attachment att : [SELECT Name, Body, ContentType,ParentId  FROM Attachment WHERE Id =:AttachmentId]){
            Attachment a = new Attachment(parentId = messageId, name=att.name, body = att.body);
            files.add(a);
            //  Id messageId = [Select Id  From EmailMessage Where RelatedToId =: recordId And CreatedDate =: CreatedDate].Id;

            // Create an instance of the Attachment object
Attachment attachmentRecord = new Attachment();
                // Set the ParentId to the ID of the email
attachmentRecord.ParentId = messageId;
                // Insert the attachment
//insert attachmentRecord;
        }
        Insert files;
    }
    
    public class emailRequests{
        @InvocableVariable(label='To Email' description ='Email Params' required = true)
        public String toMail; 
        @InvocableVariable(label='CC Email' description ='Email Params' required = false)
        public String ccMail; 
        @InvocableVariable(label='Reply To' description ='Email Params' required = false)
        public String replyTo;
        @InvocableVariable(label='Text Body' description ='Email Params' required = false)
        public String textBody;
        @InvocableVariable(label='Record Id' description ='Email Params' required = false)
        public String recordId;
        @InvocableVariable(label='Subject' description ='Email Params' required = true)
        public String subject;
        @InvocableVariable(label='Document Id' description ='Email Params' required = false)
        public List<String> DocumentIds;
    }
}