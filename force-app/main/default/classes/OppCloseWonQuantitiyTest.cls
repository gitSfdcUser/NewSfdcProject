@isTest
Private class OppCloseWonQuantitiyTest {
    @isTest 
    Private static void OppCloseWonQuantitiyTest(){
        //account
        Account acc = new Account();
        acc.name = 'taami';
        insert acc;
        //opportunity
        Opportunity opp = new Opportunity();
        opp.AccountId =acc.Id ;
        opp.name = 'Lifeline';
        opp.StageName = 'Closed Won';
        opp.CloseDate = System.Today();
        insert opp;
        // standard pricebook
        Pricebook2 std  = new Pricebook2(
            Id = Test.getStandardPricebookId(),
            isActive=true);
        Update std;
        
        //product
        Product2 pro = new Product2();            
        pro.Name = 'Book1'; 
        insert pro; 
        //PriceBookentry
        PricebookEntry PBE = new PricebookEntry();
        PBE.Pricebook2Id = std.Id;
        PBE.Product2Id =Pro.Id;
        PBE.UseStandardPrice =false;
        PBE.IsActive =true;
        PBE.UnitPrice = 1;
        insert PBE;  
        //new Pricebook
        Pricebook2  p = new Pricebook2();
        p.name='Algo Pricebook';
        p.Description ='Pricebook with All product and Price';
        p.IsActive = true;
        insert p;
        
        opportunitylineitem oppLineItem  = new opportunitylineitem();
        oppLineItem.OpportunityId = opp.Id;
        oppLineItem.Quantity = 123;
        oppLineItem.TotalPrice =20;
        oppLineItem.PricebookEntryId = PBE.Id ;
        oppLineItem.Product2Id = pro.Id ;
        insert oppLineItem;
        
        List<account> Result = OppCloseWonQuantitiy.createMethod();
         opportunitylineitem OppLineItemNew= [select id,name,OpportunityId,opportunitylineitem.opportunity.account.Id from opportunitylineitem];
         System.assertEquals(Result[0].Id, OppLineItemNew.Opportunity.account.Id);
            }
    @isTest 
    Private static void QueryAllAccountTest(){
        //account
        Account acc = new Account();
        acc.name = 'taami';
        insert acc;
        //opportunity
        Opportunity opp = new Opportunity();
        opp.AccountId =acc.Id ;
        opp.name = 'Lifeline';
        opp.StageName = 'Closed Won';
        opp.CloseDate = System.Today();
        insert opp;
        // standard pricebook
        Pricebook2 std  = new Pricebook2(
            Id = Test.getStandardPricebookId(),
            isActive=true);
        Update std;
        
        //product
        Product2 pro = new Product2();            
        pro.Name = 'Book1'; 
        insert pro; 
        //PriceBookentry
        PricebookEntry PBE = new PricebookEntry();
        PBE.Pricebook2Id = std.Id;
        PBE.Product2Id =Pro.Id;
        PBE.UseStandardPrice =false;
        PBE.IsActive =true;
        PBE.UnitPrice = 1;
        insert PBE;  
        //new Pricebook
        Pricebook2  p = new Pricebook2();
        p.name='Algo Pricebook';
        p.Description ='Pricebook with All product and Price';
        p.IsActive = true;
        insert p;
        
        opportunitylineitem oppLineItem  = new opportunitylineitem();
        oppLineItem.OpportunityId = opp.Id;
        oppLineItem.Quantity = 123;
        oppLineItem.TotalPrice =20;
        oppLineItem.PricebookEntryId = PBE.Id ;
        oppLineItem.Product2Id = pro.Id ;
        insert oppLineItem;
        
        List<account> Result = QueryAllAccount.createMethod();
         opportunitylineitem OppLineItemNew= [select id,name,OpportunityId,opportunitylineitem.opportunity.account.Id from opportunitylineitem];
         System.assertEquals(Result[0].Id, OppLineItemNew.Opportunity.account.Id);
            }
        @isTest 
    Private static void queryAllAccount2(){
        //account
        Account acc = new Account();
        acc.name = 'taami';
        insert acc;
        //opportunity
        Opportunity opp = new Opportunity();
        opp.AccountId =acc.Id ;
        opp.name = 'Lifeline';
        opp.StageName = 'Closed Won';
        opp.CloseDate = System.Today();
        insert opp;
        // standard pricebook
        Pricebook2 std  = new Pricebook2(
            Id = Test.getStandardPricebookId(),
            isActive=true);
        Update std;
        
        //product
        Product2 pro = new Product2();            
        pro.Name = 'Book1'; 
        insert pro; 
        //PriceBookentry
        PricebookEntry PBE = new PricebookEntry();
        PBE.Pricebook2Id = std.Id;
        PBE.Product2Id =Pro.Id;
        PBE.UseStandardPrice =false;
        PBE.IsActive =true;
        PBE.UnitPrice = 1;
        insert PBE;  
        //new Pricebook
        Pricebook2  p = new Pricebook2();
        p.name='Algo Pricebook';
        p.Description ='Pricebook with All product and Price';
        p.IsActive = true;
        insert p;
        
        opportunitylineitem oppLineItem  = new opportunitylineitem();
        oppLineItem.OpportunityId = opp.Id;
        oppLineItem.Quantity = 123;
        oppLineItem.TotalPrice =20;
        oppLineItem.PricebookEntryId = PBE.Id ;
        oppLineItem.Product2Id = pro.Id ;
        insert oppLineItem;
        
        List<account> Result = queryAllAccount2.createMethod();
         opportunitylineitem OppLineItemNew= [select id,name,OpportunityId,opportunitylineitem.opportunity.account.Id from opportunitylineitem];
         System.assertEquals(Result[0].Id, OppLineItemNew.Opportunity.account.Id);
            }
    
    

    
    
}