trigger LeadTrigger2 on Lead (before insert) {
    for(Lead LeadRecord2: Trigger.new){
       /* if(String.isBlank(LeadRecord2.Rating)){
           LeadRecord2.Rating='Warm';
        }   */
    }
   // System.debug('LeadRecord2 is executing');
}