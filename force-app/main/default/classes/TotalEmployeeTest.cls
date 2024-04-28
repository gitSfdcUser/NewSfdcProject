@isTest
private class TotalEmployeeTest {
    @isTest
    private static void TotalEmployeeTestMethod(){
        Account acc = new Account();
            acc.Name = 'Ashwini';
            acc.NumberOfEmployees = 6;
            acc.Working__c ='NA';
        insert acc;
        Account acc2 =new Account();
             acc2.Name = 'Ashwin Sir';
            acc2.NumberOfEmployees = 9;
            acc2.Working__c ='ASIA';
        insert acc2;
        Integer Result = TotalEmployee.createMethod();
        List <Account> AccList=[SELECT NAME,Id,NumberOfEmployees FROM Account where Working__c INCLUDES ('NA','ASIA')];
        System.assertEquals(Result, AccList[0].NumberOfEmployees+AccList[1].NumberOfEmployees);
    }

@isTest
    private static void TotalNumberEmployeeTestMethod(){
        Account acc = new Account();
            acc.Name = 'Ashwini';
            acc.NumberOfEmployees = 6;
            acc.Working__c ='NA';
        insert acc;
        Account acc2 =new Account();
             acc2.Name = 'Ashwin Sir';
            acc2.NumberOfEmployees = 9;
            acc2.Working__c ='ASIA';
        insert acc2;
        Integer ResultN = TotalNumberEmployee.createMethod();
        List <Account> AccList=[SELECT NAME,Id,NumberOfEmployees FROM Account where Working__c INCLUDES ('NA','ASIA')];
        System.assertEquals(ResultN, AccList[0].NumberOfEmployees+AccList[1].NumberOfEmployees);
    }
}