@isTest
private class NewCloningOpportunityTest {
    @isTest
    
    private static void NewCloningOpportunityTestMethod(){
        User  userr = new User();
        userr.Alias='Ikka';
        userr.Email='kim@gmail.com';
        userr.DefaultGroupNotificationFrequency ='N';
        userr.DigestFrequency = 'D';
        userr.EmailEncodingKey ='ISO-8859-1';
        
        userr.LastName = 'Sunn';
        userr.LocaleSidKey = 'en_US';
        userr.ProfileId = '00e5g000005OcKXAA0';
        userr.TimeZoneSidKey= 'Pacific/Enderbury';
        userr.Username = 'cuterohan@acme.com';
        
        userr.UserPermissionsCallCenterAutoLogin = true;
        userr.UserPermissionsMarketingUser = false;
        userr.UserPermissionsOfflineUser =true;
        userr.LanguageLocaleKey = 'en_US';
        insert userr;
        Pricebook2 SPB = new Pricebook2();
        SPB.IsActive =true;
        SPB.Name ='Any thingn';
        insert SPB;
        SPB.Id =Test.getStandardPricebookId();
        Product2 Pro = new Product2();
        Pro.Name = 'Product y';
        insert Pro;   
        Pricebook2 PB = new Pricebook2();
        PB.IsActive =true;
        PB.Name ='Any thing';
        
        insert PB;
        
        PricebookEntry PBE = new PricebookEntry();
        PBE.Pricebook2Id = SPB.Id;
        PBE.Product2Id =Pro.Id;
        PBE.UseStandardPrice =false;
        PBE.IsActive =true;
        PBE.UnitPrice = 1;
        
        insert PBE;
        
        Opportunity Opp = new Opportunity();
        Opp.Name='Newquestiontype';
        Opp.StageName='ClosedWon';
        Opp.CloseDate =System.Today();
        insert Opp;
        OpportunityLineItem OppLineItem = new OpportunityLineItem();
        OppLineItem.OpportunityId =Opp.Id;
        OppLineItem.PricebookEntryId =PBE.Id;
        OppLineItem.Quantity =4;
        OppLineItem.TotalPrice =400;
        insert OppLineItem;
        NewCloningOpportunity.createMethod();
        Opportunity Oppn =[select id,name,CloseDate from Opportunity where Id =: Opp.Id];   
       System.assertEquals(oppn.name, opp.name);
        System.assertEquals(Opp.CloseDate, opp.CloseDate);
        
        
        
        
        
        
        
    }
}