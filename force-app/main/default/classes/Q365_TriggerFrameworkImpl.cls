/* optional todo: extend or replace the example code with your own existing framework implementation */
public virtual with sharing class Q365_TriggerFrameworkImpl extends Q365_TriggerFramework
{
    private Map<SObjectType, List<Type>> triggerTypeHandlerClassesMap;

    @TestVisible
    private Map<SObjectType, List<Type>> getTriggerTypeHandlerClassesMap() {
        if (triggerTypeHandlerClassesMap == null) {
            triggerTypeHandlerClassesMap = Q365_TriggerFrameworkConfig.getTriggerTypeHandlerClassesMap();
        }
        return triggerTypeHandlerClassesMap;
    }

    public override void handleTrigger(TriggerEvent event) {
        final List<Type> handlerClasses;

        handlerClasses = getTriggerTypeHandlerClassesMap().get(event.type);
        system.debug('handlerClasses'+handlerClasses);

        if (handlerClasses != null) {
            for (Type handlerClass : handlerClasses) {
                executeTriggerHandler((Q365_TriggerHandler)Q365_DependencyInjector.getInstance().get(handlerClass), event);
            }
        }
    }

    public virtual void executeTriggerHandler(Q365_TriggerHandler handler, TriggerEvent event) {
        try {
            if (handler.isActive()) {
                switch on event.operation {
                    when BEFORE_INSERT {
                        handler.onBeforeInsert(event.newList);
                    }
                    when AFTER_INSERT {
                        handler.onAfterInsert(event.newList);
                    }
                    when BEFORE_UPDATE {
                        handler.onBeforeUpdate(event.oldList, event.newList);
                    }
                    when AFTER_UPDATE {
                        handler.onAfterUpdate(event.oldList, event.newList);
                    }
                    when BEFORE_DELETE {
                        handler.onBeforeDelete(event.oldList);
                    }
                    when AFTER_DELETE {
                        handler.onAfterDelete(event.oldList);
                    }
                    when AFTER_UNDELETE {
                        handler.onAfterUndelete(event.newList);
                    }
                }
            }
        } catch(Exception e) {
            System.debug(
                LoggingLevel.ERROR,
                'Trigger Handler (' + event.type + '/"' + event.operation + '")'
                + ' failed due to the following Exception: '
                + e.getTypeName() + ' "' + e.getMessage() + '"\n'
                + e.getStackTraceString());
            throw e;
        }
    }
}