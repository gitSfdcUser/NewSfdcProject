trigger EmployeeTrigger on Employee__c (before insert,before update) {
EmployeeTriggerHandler.handleEvents(Trigger.New,Trigger.Old,Trigger.IsInsert);
}