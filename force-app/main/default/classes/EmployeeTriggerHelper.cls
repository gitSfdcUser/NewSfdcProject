public with sharing class EmployeeTriggerHelper {
    public static void handleInsert(List<Employee__c>newList) {
        List<Employee__c> selectedEmployeeList = new List<Employee__c>();
        Set<Id> EmpIdSet = new Set<Id>();
        for(Employee__c emp:newList){
            EmpIdSet.add(emp.Tech_Firm__c);
        }
        List<Tech_Firm__c> TechFirmList =   [Select Id,name, Dano__Max_Salary__c,Min_Salary__c  from Tech_Firm__c where Id IN: EmpIdSet];

        for(Employee__c emp:newList){
            System.debug('Tech::::::'+TechFirmList);
        if(TechFirmList[0].Max_Salary__c > TechFirmList[0].Min_Salary__c)
        {
            System.debug('Inside If ::::::'+TechFirmList);
            emp.Salary__c = (TechFirmList[0].Max_Salary__c +TechFirmList[0].Min_Salary__c )/2 ;
            selectedEmployeeList.add(emp);

        }
        }


    if(!selectedEmployeeList.isEmpty()){
        System.debug('selectedEmployeeList>>>>>>>'+selectedEmployeeList);
    }
        }



        public static void handleUpdate(List<Employee__c>newList,List<Employee__c>oldList) {
            List<Employee__c> selectedEmployeeList = new List<Employee__c>();
            Set<Id> EmpIdSet = new Set<Id>();
            for(Employee__c emp:newList){
                EmpIdSet.add(emp.Tech_Firm__c);
            }
            List<Tech_Firm__c> TechFirmList =   [Select Id,name, Dano__Max_Salary__c,Min_Salary__c  from Tech_Firm__c where Id IN: EmpIdSet];
    
            for(Employee__c emp:newList){
                System.debug('Tech::::::'+TechFirmList);
            if(TechFirmList[0].Max_Salary__c > TechFirmList[0].Min_Salary__c)
            {
                System.debug('Inside If ::::::'+TechFirmList);
                emp.Salary__c = (TechFirmList[0].Max_Salary__c +TechFirmList[0].Min_Salary__c )/2 ;
                selectedEmployeeList.add(emp);
    
            }
            }
    
    
        if(!selectedEmployeeList.isEmpty()){
            System.debug('selectedEmployeeList>>>>>>>'+selectedEmployeeList);
        }
            }
    



    }    