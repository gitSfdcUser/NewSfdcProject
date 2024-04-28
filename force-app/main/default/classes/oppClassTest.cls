@isTest
private class oppClassTest {
    @isTest
    private static void oppCreateMethod(){
        
            Opportunity opp = new Opportunity();
            opp.CloseDate=Date.Today();
            opp.StageName='Prospecting';
            opp.Name='NewCreationUYN0';
        insert opp;
        oppclass.DebugWelcome();
        Opportunity oppNew =[select id,name from opportunity where id =:opp.Id Limit 1];
        system.assertEquals(oppNew.name,opp.name);
    }

}