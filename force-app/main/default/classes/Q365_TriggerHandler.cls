public interface Q365_TriggerHandler
{
    Boolean isActive();
    void onBeforeInsert(List<SObject> newList);
    void onAfterInsert(List<SObject> newList);
    void onBeforeUpdate(List<SObject> oldList, List<SObject> newList);
    void onAfterUpdate(List<SObject> oldList, List<SObject> newList);
    void onBeforeDelete(List<SObject> oldList);
    void onAfterDelete(List<SObject> oldList);
    void onAfterUndelete(List<SObject> newList);
}