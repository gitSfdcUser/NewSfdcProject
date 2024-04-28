@isTest
private class PricebookNewETest {
    @isTest
    private static void PricebookNewETestmethod(){
        
        /*Pricebook2 SPB = new Pricebook2();
        SPB.IsActive =false;
        SPB.Name ='Any thingn';
        insert SPB;
        SPB.Id = Test.getStandardPricebookId();
        
        Product2 pro = new Product2();            
        pro.Name = 'Book1'; 
        insert pro; 
        
        PricebookEntry PBE = new PricebookEntry();
        PBE.Pricebook2Id = SPB.Id;
        PBE.Product2Id =Pro.Id;
        PBE.UseStandardPrice =false;
        PBE.IsActive =true;
        PBE.UnitPrice = 1;
        insert PBE;  
        
        Pricebook2  p = new Pricebook2();
        p.name='Algo Pricebook';
        p.Description ='Pricebook with All product and Price';
        p.IsActive = true;
        insert p;
        pricebookNewE.PriceBookController();
        pricebook2 pnew =[select id,name, 
                          (select id,product2Id,name from PricebookEntries) 
                          from pricebook2 where Id =: P.Id];
            
          product2 pronew =[select id,name, 
                          (select id,pricebook2Id,name from PricebookEntries) 
                          from product2 where Id =: Pro.Id];*/
        Pricebook2 std  = new Pricebook2(
        Id = Test.getStandardPricebookId(),
        isActive=true);
        Update std;
        
            
        Pricebook2 Algo = PricebookNewE.PriceBookController();
        
        
        System.assertEquals('pricebookji', Algo.Name);
    }
    @isTest
    private static void NewPriceBookTestMethod(){
        Pricebook2 std  = new Pricebook2(
        Id = Test.getStandardPricebookId(),
        isActive=true);
        Update std;
        
            
        Pricebook2 Algo2 = NewPriceBook.createMethod();
        
        
        System.assertEquals('Algo', Algo2.Name);
    }
    
    
        
    }