trigger RequireRejectionComment on Opportunity (before update) {
  if (Trigger.isUpdate) {
    Map<Id, Opportunity> rejectedStatements = new Map<Id, Opportunity>();

    for (Opportunity inv : Trigger.new) {
      Opportunity oldInv = Trigger.oldMap.get(inv.Id);

      if (oldInv.Approval_Status__c != 'Rejected' && inv.Approval_Status__c == 'Rejected') {
        rejectedStatements.put(inv.Id, inv);
      }
    }

    if (!rejectedStatements.isEmpty()) {
      List<Id> processInstanceIds = new List<Id>();

      for (Opportunity invs : [SELECT (SELECT Id FROM ProcessInstances ORDER BY CreatedDate DESC LIMIT 1)
                               FROM Opportunity WHERE Id IN :rejectedStatements.keySet()]) {
        if (!invs.ProcessInstances.isEmpty()) {
          processInstanceIds.add(invs.ProcessInstances[0].Id);
        }
      }

      if (!processInstanceIds.isEmpty()) {
        for (ProcessInstance pi : [SELECT TargetObjectId,
                                         (SELECT Id, StepStatus, Comments,OriginalActorId,ActorID 
                                          FROM Steps
                                          ORDER BY CreatedDate DESC
                                          LIMIT 1)
                                   FROM ProcessInstance
                                   WHERE Id IN :processInstanceIds
                                   ORDER BY CreatedDate DESC]) {
                                       System.debug('pi.Steps[0].Comments>>>'+pi.Steps[0].Comments);
                           System.debug('pi.Steps[0].Comments>>>'+pi.Steps);
//|| pi.Steps[0].Comments=='TestCommentId1'
          if (pi.Steps.size() > 0 && (pi.Steps[0].Comments == null || pi.Steps[0].Comments.trim().length() == 0 )) {
            rejectedStatements.get(pi.TargetObjectId).addError('Operation Cancelled: Please provide a rejection reason!');
          }
        }
      }
    }
  }
}