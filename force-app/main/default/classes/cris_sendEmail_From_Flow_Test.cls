@isTest
public class cris_sendEmail_From_Flow_Test {
    @isTest
    public static void sendEmailUsingFlowtest(){
        List<cris_sendEmail_From_Flow.emailRequests> strLists = new List<cris_sendEmail_From_Flow.emailRequests>();
        cris_sendEmail_From_Flow.emailRequests strList = new cris_sendEmail_From_Flow.emailRequests();
        //cris_Registry__c crs = new cris_Registry__c();
        //crs.Nickname__c = 'Test';
        //insert crs;
        //New Data
        // Create a test attachment record with test data
        Attachment testAttachment = new Attachment();
        testAttachment.Name = 'Test Image';
        testAttachment.Body = Blob.valueOf('Test image content');
        testAttachment.ContentType = 'image/png';
        //testAttachment.ParentId = crs.Id;
        insert testAttachment;
        
        /*Attachment attach=new Attachment();   	
        attach.Name='Unit Test Attachment';
        Blob bodyBlob=Blob.valueOf('Unit Test Attachment Body');
        attach.body=bodyBlob;
        attach.parentId=crs.id;
        insert attach; */
        strList.toMail = 'test@test.com';
        strList.ccMail = 'test@test.com';
        strList.replyTo = 'test@test.com';
        strList.textBody = 'Testing';
       // strList.recordId = crs.Id;
       
        strList.subject = 'test';
        strList.DocumentIds = new List<String>{testAttachment.id};
            strLists.Add(strList);
        
        cris_sendEmail_From_Flow.sendEmailUsingFlow(strLists);
        Test.startTest();
       // cris_sendEmail_From_Flow.addAttachmentToEmailActivity(crs.Id,testAttachment.Id,Datetime.now());
        Test.stopTest();
        
       // List<Attachment> attachments=[select id, name from Attachment where parent.Id=:crs.Id];
        //System.assertEquals(1, attachments.size());
    }
}