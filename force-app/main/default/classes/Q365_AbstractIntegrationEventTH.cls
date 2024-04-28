public abstract with sharing class Q365_AbstractIntegrationEventTH extends Q365_AbstractTriggerHandler
{
    public virtual override Boolean isActive() {
        return true;
    }
    public virtual override void onAfterInsert(List<SObject> newList) {
        System.debug('Called Framework');
    }

    
}