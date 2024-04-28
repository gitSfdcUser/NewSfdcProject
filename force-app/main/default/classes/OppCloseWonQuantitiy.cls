public class OppCloseWonQuantitiy {
    public static List<account> createMethod(){
        //creating set of account 
        List<account> acclist =new list<account>();
        //query opportunity where stagename is closed won.
        List<opportunity> Opplist=[select name,account.id,account.name from opportunity where stagename='Closed Won'];
        //query opportunity where Opportunity line item quantityis greater than 100
        
list<opportunitylineitem> Oppilist=[select id, name,quantity,Opportunity.name,opportunity.stagename,opportunity.id from opportunitylineitem where quantity>100];

        
system.debug('opportunity=='+Opplist.size());
system.debug('opportunitylineiteem=='+Oppilist.size());

if(Opplist.size()>0) {
    
for(opportunity opp:Opplist) {
for(opportunitylineitem oli : Oppilist){
if(oli.quantity>5){
if(opp.id==oli.opportunity.id)
{
Account acc=new Account(name=opp.account.Id,Id=opp.AccountId);
acclist.add(acc);
}
}
}
}
}
system.debug('account=='+acclist[0].id);
        return acclist;
        
            
        

    
    }
}