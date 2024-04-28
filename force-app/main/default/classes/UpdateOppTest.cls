@isTest
private class UpdateOppTest {
    @isTest
    private static void UpdateOppTestMethod(){
        opportunity opp = new opportunity();
        opp.Name='GameReal';
        opp.CloseDate= system.today();
        opp.StageName='ClosedDate';
        insert opp;
        UpdateOpp.createmethod();
        
       opportunity oppn = [select id,name,StageName,CloseDate from Opportunity where Id =: opp.Id];
        System.assertEquals(oppn.Name,'Game'+opp.name);
    }

}