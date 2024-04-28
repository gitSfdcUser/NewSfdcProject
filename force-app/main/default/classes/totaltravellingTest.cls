@isTest
private class totaltravellingTest {
    @isTest
    private static void totaltravellingTestMethod(){
          PLANS__c Plan = new PLANS__c();
        Plan.Travel_Hour__c = 4;
        Plan.Travel_Locations__c ='A';
        insert Plan;
                  PLANS__c Planf = new PLANS__c();
        Planf.Travel_Hour__c = 3;
        Planf.Travel_Locations__c ='F';
        insert Planf;
        
        List<PLANS__c> PlanNew =[SELECT Id,Travel_Hour__c FROM PLANS__c where Travel_Locations__c INCLUDES ('A','F')];
        Decimal TotalHour = TotalTravelling.createMethod();
        system.assertEquals(TotalHour, PlanNew[0].Travel_Hour__c + PlanNew[1].Travel_Hour__c);
        
    } 
    
}