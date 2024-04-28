trigger myAccountTrigger on Account (before insert,after insert,before update,after update) {
    if(Trigger.isInsert){
        if(Trigger.isBefore){
            AccountHandlerClass.UpdateRating(Trigger.New);
        }else if(Trigger.isAfter){
            AccountHandlerClass.CreateRelatedRecord(Trigger.New);
            
        }
    }
        if(Trigger.isUpdate){
            if(Trigger.isBefore){
            AccountHandlerClass.UpdatePhoneDescription(Trigger.New,Trigger.OldMap);
        }else if(Trigger.isAfter){
            AccountHandlerClass.updateRelatedOppPhone(Trigger.New,Trigger.OldMap);
            
        }
    }
}