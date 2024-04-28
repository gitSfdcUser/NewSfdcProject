public class AssignDevelopernameTriggerHandler{
        private static boolean  stopRecurrence = false;
        public static void assignNewDeveloperName(List<opportunity> newList){
            if(stopRecurrence == true ){
                     return;
                }

                
        System.debug('newList::::'+newList);
        List<opportunity> oppList = new List<Opportunity>();
        for(Opportunity  opp: newList){
            integer i= 1;
              opp.Name = 'Test'+i;
              opp.Stagename = 'testing Stage here';
              oppList.add(opp);
            i++;
        }
        if(!oppList.isEmpty()){
          stopRecurrence = false;
           // update oppList;
        }
    }
}