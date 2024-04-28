/* optional todo: replace the example trigger framework with your own existing framework */
public abstract with sharing class Q365_TriggerFramework
{
    public class TriggerEvent
    {
        public final Schema.SObjectType type;
        public final System.TriggerOperation operation;
        public final List<SObject> oldList;
        public final List<SObject> newList;
// this is constructor to get the type ,Operation and value of current trigger context
        public TriggerEvent(Schema.SObjectType type, System.TriggerOperation operation) {//Here we get the type of object and on which event trigger is firing 
            this.type = type;
            this.operation = operation;
            this.oldList = new List<SObject>();
            this.newList = new List<SObject>();
        }
    }

    public class TriggerFrameworkException extends Exception {}

    //when trigger will fire this method wil call first
    public abstract void handleTrigger(TriggerEvent event);

    private static Q365_TriggerFramework getInstance() {
        return (Q365_TriggerFramework)Q365_DependencyInjector.getInstance()
                    .get(Q365_TriggerFramework.class);
    }

    public static void handleTrigger() {//1
        System.debug('Called Handletrigger');
        try {
            if (trigger.isExecuting) {
                getInstance().handleTrigger( getCurrentTriggerEvent() );//2
              // Q365_TriggerFrameworkImpl.handleTrigger(trigger.new);
            }
        } catch(Exception e) {
            System.debug(
                LoggingLevel.ERROR,
                'Trigger Handler Framework allowed the following exception to pass: '
                + e.getTypeName() + ' "' + e.getMessage() + '"');
            throw e;
        }
    }

    public static TriggerEvent getCurrentTriggerEvent() { //this method is returning a type of class
        final TriggerEvent event;
         system.debug('trigger.operationType'+getCurrentTriggerOperation());
        event = new TriggerEvent(getCurrentTriggerType(), getCurrentTriggerOperation());

        if (trigger.old != null) {
            event.oldList.addAll(trigger.old);
        }
        if (trigger.new != null) {
            event.newList.addAll(trigger.new);
        }

        return event;
    }
 
    private static System.TriggerOperation getCurrentTriggerOperation() {
        return trigger.operationType;
        
    }

    @SuppressWarnings('PMD.AvoidDirectAccessTriggerMap')
    private static Schema.SObjectType getCurrentTriggerType() {
        Schema.SObjectType type = null;

        if (trigger.isExecuting && trigger.size > 0) {
            if (trigger.isInsert || trigger.isUpdate || trigger.isUndelete) {
                type = Trigger.new[0].getSObjectType();
            } else {
                type = Trigger.old[0].getSObjectType();
            }
        }

        return type;
    }
}