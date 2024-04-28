public class UpdatePriceook {
    public static List<PricebookEntry> UpdateStandardPrice(List<Product2>newList){       
        System.debug(newList);
        //for standard pricebook
        Pricebook2 Spb = new Pricebook2();
        Spb= [Select id from Pricebook2 Where isStandard=true limit 1];
        System.debug(Spb);
        List<PricebookEntry> PricebookEntryList = new List<PricebookEntry>();
        for(product2 p:newList){
            PricebookEntry Pbes= new PricebookEntry();
            Pbes.Pricebook2Id  =Spb.id;
            Pbes.IsActive = true;
            Pbes.Product2Id=p.id;
            Pbes.UnitPrice=1;
            PricebookEntryList.add(Pbes);
        }
        System.debug(PricebookEntryList);
        if (PricebookEntryList.size() > 0) {
            insert PricebookEntryList;
        }
        return PricebookEntryList;
    }
}