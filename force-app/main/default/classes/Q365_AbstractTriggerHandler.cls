public abstract with sharing class Q365_AbstractTriggerHandler implements Q365_TriggerHandler
{
    public abstract Boolean isActive();

    public virtual void onBeforeInsert(List<SObject> newList) { return; }
    public virtual void onAfterInsert(List<SObject> newList) { return; }
    public virtual void onBeforeUpdate(List<SObject> oldList, List<SObject> newList) { return; }
    public virtual void onAfterUpdate(List<SObject> oldList, List<SObject> newList) { return; }
    public virtual void onBeforeDelete(List<SObject> oldList) { return; }
    public virtual void onAfterDelete(List<SObject> oldList) { return; }
    public virtual void onAfterUndelete(List<SObject> newList) { return; }
}