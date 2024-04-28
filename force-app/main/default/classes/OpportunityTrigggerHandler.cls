public class OpportunityTrigggerHandler {
    public static void UpdateContactRoleOnOpp(List<Opportunity>OppList){
        //set of Id
        set<Id> OppIds = new set<Id>();
        List<Contact> ConList = new  List<Contact>();
        //Iterating OppList one by one to get its AccountId and Put it into set--- OppIds
        for(Opportunity Opp: OppList){
            if(Opp.AccountId != null){
                OppIds.add(Opp.AccountId);
                System.debug('Opp.AccountId>>>'+Opp.AccountId);
                System.debug('OppIds'+OppIds);
            }
            //query those contact record whic accountId same as OppIds set
            ConList=[select id,name,AccountId from contact where  AccountId IN : OppIds];
            System.debug('ConList>>'+ConList);
            //creating newList for OpportunityContactRole
            List<OpportunityContactRole> OppContRole = new List<OpportunityContactRole>();
            //iterating ConList for creating same no. of contact role record as contact,which are present in Our conList
            for(Contact Con: ConList){
                if(Con.AccountId != null){
                    
                    System.debug('Opp.AccountId>>>>+ Opp.'+Opp.AccountId);
                    OpportunityContactRole OppCR =new OpportunityContactRole();
                    OppCR.Role='Decision Maker';
                    OppCR.IsPrimary=true;
                    OppCR.OpportunityId=Opp.Id;
                    OppCR.ContactId=Con.Id;
                    OppContRole.add(OppCR);
                }
                //Null check And Inserting record.
            } if(!OppContRole.isEmpty()){
                insert OppContRole;
                System.debug(OppContRole);
            }
        }
    }
}