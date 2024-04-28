public with sharing class UserStoryTriggerHandler {
public static final Boolean recursionFlag = true;

    public UserStoryTriggerHandler() {

    }
    public static void descriptionFieldShouldNotBeEmpty(List<Dano__UserStory__c> newUserStoryList){
        for(Dano__UserStory__c du : newUserStoryList){
            if(du.Dano__Description__c == null || du.Dano__Description__c == ''){
                du.Dano__Description__c.addError('This Description is mandatory due to Trigger:');
            }
                }
    }
    public static void updatedDescriptionCannotBeSameasprevious(Map<id,Dano__UserStory__c> newMap,Map<id,Dano__UserStory__c> oldmap){
        for(Dano__UserStory__c du : newMap.values()){
            if(du.Dano__Description__c ==  oldmap.get(du.Id).Dano__Description__c  ){
                du.Dano__Description__c.addError('description should be changed whenever updated::::');
            }
                }
    }
        public static void validateBeforeDelete(Map<id,Dano__UserStory__c> oldmap){
            System.debug('Delete method called::: ');
        for(Dano__UserStory__c du : oldmap.values()){
            if(oldmap.get(du.Id).Dano__Description__c != 'COMPLETED' ){
                du.Dano__Description__c.addError('Description filled should be completed');
            }
                }
    }
}