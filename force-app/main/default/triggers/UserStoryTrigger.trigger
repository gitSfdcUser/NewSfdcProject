trigger UserStoryTrigger on Dano__UserStory__c(before insert,before update,before delete) {
  // write some code for automation
  if (Trigger.isExecuting) {

    if (Trigger.isBefore && Trigger.isInsert) {
        UserStoryTriggerHandler.descriptionFieldShouldNotBeEmpty(Trigger.new);
    }

    if (Trigger.isBefore && Trigger.isUpdate) {
        UserStoryTriggerHandler.updatedDescriptionCannotBeSameasprevious(Trigger.newMap,Trigger.oldMap);
    }
    if(Trigger.isBefore && Trigger.isDelete)
        UserStoryTriggerHandler.validateBeforeDelete(Trigger.oldMap);

  
  }

}