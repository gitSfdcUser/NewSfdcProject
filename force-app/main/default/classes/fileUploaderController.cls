public class fileUploaderController {
    @AuraEnabled
public static void createAttachment(String fileName, String base64Data, String contentType) {
    Attachment attachment = new Attachment();
    attachment.ParentId = '5005g00000esUhVAAU';
    attachment.Name = fileName;
    attachment.Body = EncodingUtil.base64Decode(base64Data);
    attachment.ContentType = contentType;
    insert attachment;
}


}