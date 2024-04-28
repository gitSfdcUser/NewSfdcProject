trigger myTestTrigger on Lead (before insert,before update,after update) {
//System.debug('Lead trigger fired');
    for(Lead Leadrecord: Trigger.New)
        //if(String.isBlank(Leadrecord.LeadSource)){
        if(trigger.isBefore && String.isBlank(Leadrecord.LeadSource)){
            Leadrecord.LeadSource='other';
            if((Leadrecord.Status=='Closed-Converted'|| Leadrecord.Status=='Closed Not-Converted') && Trigger.oldMap.get(Leadrecord.Id).Status=='Open - Not Contacted')
               { 
                   Leadrecord.Status.addError('you cant closed it as open');
                   
               }
                
            }
            

        }