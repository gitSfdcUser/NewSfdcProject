public class NewPriceBook {
    public static Pricebook2 createMethod(){
          Pricebook2 Pb = new Pricebook2();
        try{
            //creating pricebook pb
          
            pb.name='Algo';
            pb.IsActive= true;
            insert pb;
            
            //creating newpricebook for standard pricebook
            Pricebook2 Spb = new Pricebook2();
            Spb= [Select id from Pricebook2 Where isStandard=true limit 1];
            //creaing List of Productandfilling value
            List<Product2> prodList= new List<Product2>();
            for(Integer i=0;i<10;i++){
                Product2 pro = new Product2();
                pro.Name='alg';
                pro.Description='FGGHGHGHG';
                prodList.add(pro);
            }
            //creating record
            insert prodList;
            List<PricebookEntry> pbesList = new List<PricebookEntry>();
            for(product2 p:prodList){
                PricebookEntry Pbes= new PricebookEntry();
                Pbes.Pricebook2Id  =Spb.id;
                Pbes.IsActive = true;
                Pbes.Product2Id=p.id;
                Pbes.UnitPrice=23;
                pbesList.add(Pbes);
            }
            insert PbesList;
            
            //adding custom pricebook here
            List<PricebookEntry> pbeList = new List<PricebookEntry>();
            for(product2 p:prodList){
                PricebookEntry Pbe= new PricebookEntry();
                Pbe.Pricebook2Id  =pb.id;
                Pbe.IsActive = true;
                Pbe.Product2Id=p.id;
                Pbe.UnitPrice=23;
                pbeList.add(Pbe);
            }
            insert PbeList;
            
        }catch(Exception er){ 
            System.debug('Exception error'+ er);
        }
        return Pb;
    } 
}