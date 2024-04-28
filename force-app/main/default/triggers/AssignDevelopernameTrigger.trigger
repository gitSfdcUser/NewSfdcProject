trigger  AssignDevelopernameTrigger on Opportunity(before insert){
if(Trigger.Isinsert){
AssignDevelopernameTriggerHandler.assignNewDeveloperName(Trigger.New);
}
}