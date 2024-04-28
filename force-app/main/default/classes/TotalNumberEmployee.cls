public class TotalNumberEmployee {
    public static Integer createMethod(){
        List<Account> AccList= new List<Account>();
        AccList=[SELECT NAME,Id,NumberOfEmployees FROM Account where Working__c INCLUDES ('NA','ASIA')];
        System.debug(AccList);
        Integer TotalEmployees=0;
        for(Account acc:AccList){
            TotalEmployees =TotalEmployees+ acc.NumberOfEmployees;
        }
        System.debug(TotalEmployees);
        return TotalEmployees;
    }

}