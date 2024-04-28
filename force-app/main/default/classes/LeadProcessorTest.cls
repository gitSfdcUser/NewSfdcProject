@isTest
private class LeadProcessorTest {
    @isTest
    private static void testBatchClass(){
        //Load test data
       List<Lead> LeadList = new List<Lead>();
        for(integer i=0;i<200;i++){
            Lead l  = new lead();
            l.LastName = 'testing';
            l.Company = 'salesforce';
            LeadList.add(l);
        }
        insert LeadList;
        //performing Testing in test class
        Test.startTest();
        LeadProcessor lp = new LeadProcessor();
        Id batchId = Database.executeBatch(lp, 200);
        Test.stopTest();
        //Check the result
        List<Lead>updatedLeads = [select id  from Lead where Leadsource ='Dreamforce'];
        System.assertEquals(200,updatedLeads.size() , 'if any dml error occured in any one record  in list');
    }

}