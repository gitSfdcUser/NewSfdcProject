public class PricebookNewE {
    public static Pricebook2 PriceBookController(){
        Pricebook2 Algo =new Pricebook2();
        try{
            //create a pricebook
            
            Algo.Name='pricebookji';
            Algo.IsActive=true;
            Algo.Description='Real one';
            insert Algo;
            //query
            Pricebook2 spb= new Pricebook2();
            spb=[select id,name from Pricebook2 where isStandard=true limit 1];
            //creating product
            List<Product2> ProList= new List<Product2>();
            for(Integer i=0;i<10;i++){
                Product2 pro=new product2(); 
                pro.Name='Algevo';
                pro.Description='dshajksdfiejfcieodjfcijewd';
                pro.isActive = true;
                proList.add(pro);
            }
            insert ProList;
            //list of pbes
            List<PricebookEntry>pbesList= new List<PricebookEntry>();
            for(Integer i=0;i<10;i++){
                PricebookEntry pbes = new PricebookEntry();
                pbes.IsActive=true;
                pbes.Product2Id =ProList[i].Id;
                pbes.Pricebook2Id =spb.Id;
                pbes.UnitPrice = 2;
                //  pbes.UseStandardPrice =false;
                pbesList.add(pbes);
            }
            insert pbesList;
            
            List<PricebookEntry>pbesCusList= new List<PricebookEntry>();
            for(Integer i=0;i<10;i++){
                PricebookEntry pbesCus = new PricebookEntry();
                pbesCus.IsActive=true;
                pbesCus.Product2Id=proList[i].Id;
                pbesCUS.Pricebook2Id = Algo.Id;
                pbesCus.UnitPrice=30;
                // pbesCus.UseStandardPrice=false;
                pbesCusList.add(pbesCus);
            }
            insert pbesCusList;
            
        }catch(Exception e){
            system.debug('error occurred in line>>>.'+ e.getLineNumber() +'err>>>'+ e.getMessage());
            
        } 
        return Algo;
    }
    
}