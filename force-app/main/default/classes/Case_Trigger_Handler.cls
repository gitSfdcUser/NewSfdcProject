public with sharing class Case_Trigger_Handler extends TriggerHandler{
    private Map<Id, Case> newCaseMap;
    public Case_Trigger_Handler(){
        this.newCaseMap = (Map<Id, Case>) Trigger.newMap;
    }
    public override void beforeInsert() {
        for(Case cs : (List<Case>) Trigger.new) {
            cs.Dano__Product__c = 'GC1060';
            cs.Priority = 'High';
          // do something
          System.debug('cs::::'+cs);
        }
      }
    
      // add overrides for other contexts
    
    }