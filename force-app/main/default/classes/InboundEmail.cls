public class InboundEmail implements messaging.InboundEmailHandler{
    public messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email,messaging.InboundEnvelope env){
        Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();
        try{
            String fromAdd = email.fromAddress;
            contact cont = [select id,name from contact where email =:fromAdd];
            result.success = true;
            case c = new case();
            c.status = 'New';
            c.Priority= 'Normal';
            c.Origin = 'Email';
            c.subject =email.subject;
            c.Description =email.plaintextbody;
            c.ContactId = cont.id;
            insert c;
            // For Creating follow up task
            Task t = new Task();
            t.Subject = email.subject;
            t.Status = 'Received';
            t.Description = email.plaintextbody;
            //t.WhatId = cont.id; // Related Object Id
            t.Type = 'InBound Email';
            t.WhoId = cont.id;
            t.ActivityDate = system.today();
            if (t != null){
                insert t;
                System.debug('Task>>>'+t);
            }
            
        }catch(exception e){
            result.success = false;
            System.debug('Exception occur due to>>>>>>>'+e.getMessage()+'   	 Exception at line no.>>>>>>>'+e.getLineNumber());
        }
        return result;
    }
}