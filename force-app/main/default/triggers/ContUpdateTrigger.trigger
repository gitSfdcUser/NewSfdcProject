trigger ContUpdateTrigger on Contact (after insert,after update,after delete){
if(trigger.isAfter){
    if(Trigger.isInsert){
        system.debug('Insert trigger');
        ContactHandlerTrigger.onAfterInsert(Trigger.New);
    }else if(Trigger.Isupdate){
        system.debug('update trigger');
        ContactHandlerTrigger.OnAfterUpdate(Trigger.New,Trigger.oldMap);
    }else if(Trigger.isDelete){
        system.debug('delete trigger');
        ContactHandlerTrigger.OnAfterDelete(Trigger.Old);
        system.debug('TRIgger old--'+Trigger.Old);
    }
    
    }       
    }