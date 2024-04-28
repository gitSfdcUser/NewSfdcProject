public with sharing class EmployeeTriggerHandler {
    public static void handleEvents(List<Employee__c>newList,List<Employee__c>oldList,Boolean IsInsert) {
       // insert method
        if(IsInsert){
            EmployeeTriggerHelper.handleInsert(newList);

        }else{
            //update method 
            EmployeeTriggerHelper.handleUpdate(newList,oldList);

        }

    }
    }
