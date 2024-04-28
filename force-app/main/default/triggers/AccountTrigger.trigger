trigger AccountTrigger on Account (after update) {
    if(trigger.IsUpdate){
        AccountTriggerHandler.handletriggerLogic(Trigger.New);
    }
}