public class TotalTravelling {
    public static Decimal createMethod(){
        List<PLANS__c> PlanList = new List<PLANS__c>();
        PLanList =[SELECT Id,Travel_Hour__c FROM PLANS__c where Travel_Locations__c INCLUDES('A','F')];
        system.debug('PLanList:::'+PLanList);
        
        Decimal totelhours = 0;
        for(PLANS__c p: PlanList){
            totelhours = totelhours + p.Travel_Hour__c;
            
        }
        System.debug(totelhours);
        return totelhours;
    }
}