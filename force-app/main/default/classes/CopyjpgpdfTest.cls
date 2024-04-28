@isTest
private class CopyjpgpdfTest {
    
    @isTest
    private static void CopyjpgpdfTestMethod(){
        List<Contact> ConIds = new List<Contact>();
        
        Account acc =  new account();
        acc.Name = 'NewOneoliviaoliviakingkingking';
        insert acc;
        String body = 'XXXXXXXXXXXXX';
        Attachment atc =  new Attachment();
        atc.ParentId = acc.Id;
        atc.name = 'NewAttachment';
        atc.body = Blob.valueof('XXXXXXXXXXXXX');
        insert atc;
        contact con =  new contact();
        
        con.AccountId =acc.Id;
        con.LastName = 'Olivia';
        insert con;
        
        List<Attachment> Result = Copyjpgpdf.createMethod();
        
        contact conn = [select id,AccountId,name from contact where Id =:  Result[0].ParentId];
        
        List<Attachment>NewTestAtcList = [select id,Name,body,ParentId from Attachment where ParentId =: acc.Id ];
        System.assertEquals(conn.AccountId, NewTestAtcList[0].ParentId);
        
    }
    
}