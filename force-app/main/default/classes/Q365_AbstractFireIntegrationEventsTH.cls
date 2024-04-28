public abstract with sharing class Q365_AbstractFireIntegrationEventsTH extends Q365_AbstractTriggerHandler
{
    private static final Map<Id, Boolean> RECORD_PROCESSING_MAP = new Map<Id, Boolean>();

    protected abstract SObjectField getFireEventsRecordField();

    protected abstract Boolean isFireEventsOnInsert(SObject newRecord);

    protected abstract Boolean isFireEventsOnUpdate(SObject oldRecord, SObject newRecord);

    protected abstract Boolean isFireEventsOnDelete(SObject oldRecord);

    protected abstract List<SObject> createPlatformEvents(SObject record, System.TriggerOperation triggerOperation);

    public virtual Boolean isFireEventsDisabled(SObject record) {
        return false;
    }

    public virtual override Boolean isActive() {
        return true;
    }

    public virtual override void onBeforeInsert(List<SObject> newList) {
        final SObjectField fireEventRecordField;

        fireEventRecordField = getFireEventsRecordField();

        if (fireEventRecordField != null) {
            for (SObject record : newList) {
                record.put(fireEventRecordField, false);
            }
        }
    }
    /*

    public virtual override void onAfterInsert(List<SObject> newList) {
        for (SObject record : newList) {
            if (isFireEventsOnInsert(record) && !record.hasErrors()) {
                RECORD_PROCESSING_MAP.put(record.Id, false);
            }
        }

        firePlatformEvents(newList, System.TriggerOperation.AFTER_INSERT);
    }

    public virtual override void onBeforeUpdate(List<SObject> oldList, List<SObject> newList) {
        final SObjectField fireEventRecordField;

        fireEventRecordField = getFireEventsRecordField();

        if (fireEventRecordField != null) {
            for (SObject record : newList) {
                if (record.get(fireEventRecordField) == true && !record.hasErrors()) {
                    record.put(fireEventRecordField, false);
                    RECORD_PROCESSING_MAP.put(record.Id, false);
                }
            }
        }
    }

    public virtual override void onAfterUpdate(List<SObject> oldList, List<SObject> newList) {
        for (Integer i=0; i < newList.size(); i++) {
            final SObject record;

            record = newList.get(i);

            if (!record.hasErrors()
                && isFireEventsOnUpdate(oldList.get(i), record)
                && !RECORD_PROCESSING_MAP.containsKey(record.Id))
            {
                RECORD_PROCESSING_MAP.put(record.Id, false);
            }
        }

        firePlatformEvents(newList, System.TriggerOperation.AFTER_UPDATE);
    }


    public virtual override void onAfterDelete(List<SObject> oldList) {
        for (SObject record : oldList) {
            if (isFireEventsOnDelete(record) && !record.hasErrors()) {
                RECORD_PROCESSING_MAP.put(record.Id, false);
            }
        }


     firePlatformEvents(oldList, System.TriggerOperation.AFTER_DELETE);  
    }
*/
    @SuppressWarnings('PMD.CognitiveComplexity')
    protected virtual void firePlatformEvents(List<SObject> newList, System.TriggerOperation triggerOperation) {
        final Map<SObjectType, List<SObject>> typeEventsMap;

        typeEventsMap = new Map<SObjectType, List<SObject>>();

        for (SObject record : newList) {
            if (record.Id == null || record.hasErrors() || isFireEventsDisabled(record)) {
                continue;
            }
            // create integration events for all records (max. once per transaction!)
            if (RECORD_PROCESSING_MAP.get(record.Id) == false) {
                RECORD_PROCESSING_MAP.put(record.Id, true);
                for (SObject eventRecord : createPlatformEvents(record, triggerOperation)) {
                    // store events in lists separated by type (preserving order per type)
                    List<SObject> events = typeEventsMap.get(eventRecord.getSObjectType());
                    if (events == null) {
                        events = new List<SObject>();
                        typeEventsMap.put(eventRecord.getSObjectType(), events);
                    }
                    events.add(eventRecord);
                }
            }
        }

        // publish in typed batches to prevent chunking errors ("Cannot have more than 10 chunks in a single operation. Please rearrange the data to reduce chunking.")
        for (SObjectType eventType : typeEventsMap.keySet()) {
            EventBus.publish(typeEventsMap.get(eventType));
        }
    }
}