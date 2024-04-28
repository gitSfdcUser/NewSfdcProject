public class NewCloningOpportunity {
    public static void createMethod(){
        //creating  instance of Opportuity
        Opportunity Opp =new Opportunity();
                //creating  instance of OpportuityLineItem
OpportunityLineItem Pbe= new OpportunityLineItem();
       // query id,close date where Opportunity Name is Newquestiontype;
        Opp=[select id,name,CloseDate, (select id,name,OpportunityId,PricebookEntryId from OpportunityLineItems)from Opportunity where name='Newquestiontype' limit 1];
  Pbe=[select id,name,PricebookEntryId,Quantity from OpportunityLineItem];
        System.debug(opp);
        //creating new instance of Opportunity And OpportunityLineItem
        Opportunity NewOpp =new Opportunity();
        OpportunityLineItem Oppro= new OpportunityLineItem();
        
        //null check
        if(Opp.Id!=null){
            
            NewOpp=Opp.clone();
            Oppro.OpportunityId=Opp.Id;
            Oppro.PricebookEntryId=Pbe.PricebookEntryId;
            Oppro.Quantity = 4;
            Oppro.TotalPrice =400;
         
            NewOpp.CloseDate= Opp.CloseDate.addDays(30);
            NewOpp.Name =Opp.Name + 'Clone';
            NewOpp.StageName='Prospecting';
            System.debug(NewOpp);
        }insert NewOpp;
        insert Oppro;
        
    }
}