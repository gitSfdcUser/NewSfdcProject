public class QueryThisWeek {
    public static void createMethod(){
        List<lead> leadList = new List<lead>();
        leadList=[SELECT Id, record__c FROM lead WHERE CreatedDate = THIS_WEEK];
        System.debug(leadList);
    }

}