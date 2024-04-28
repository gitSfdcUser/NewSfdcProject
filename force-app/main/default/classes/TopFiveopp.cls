public class TopFiveopp {
    @AuraEnabled
    public static List<Opportunity> TopFiveoppMethod(){
        List<Opportunity> OppList =
        [SELECT Id,Name FROM Opportunity WHERE StageName = 'Closed Won' AND CloseDate < TODAY limit 5];
        System.debug('OppList>>>'+OppList);
         return OppList;
    }
}