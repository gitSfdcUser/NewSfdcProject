trigger JobTrigger on Dano__wake_up__c (before insert) {
    //Do something
    System.debug('Testing:::: before trigger');
    System.debug('Trigger.new:::: before trigger'+Trigger.new);
    System.debug('Trigger.newMap:::: before trigger'+Trigger.newMap);
    System.debug('Trigger.Old:::: before trigger'+Trigger.Old);
    System.debug('Trigger.OldMap:::: before trigger'+Trigger.OldMap);
    System.debug('Testing:::: before trigger');

}