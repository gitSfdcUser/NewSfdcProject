public class LearningOOPs {
    public static void testOpp(){
        Students std = new Students();
LearningOOPs  nAl = new LearningOOPs();

        
      //  Students std2 = new Students();
      //  std.testNum = 4;
       // std.testName = 'Ram';
        
        
        System.debug(std+ '\n');
    }
    
    
    public static void NewWayToLoop(){
        List<String> strList = new List<String> {'Ram','Ram Ram','Jai Shree Ram','jai Shree Ram...','Akhand Bharat'};
            List<Students> stdList = new List<Students>();
        for(string str: strList){
            Students std = new Students();
            System.debug(std);
            std.testNum = strList.indexOf(str);
            std.testName = str;
            stdList.add(std);
        }
        System.debug(stdList);
    }
    
    public static Boolean isTimeValidationMet(DateTime completedDate) {
    // Calculate the difference in hours between NOW and Completed_Date__c
    Decimal hoursDiff = (DateTime.now().getTime() - completedDate.getTime()) / (1000 * 60 * 60);
        System.debug('hoursDiff>>>>'+hoursDiff);

    // Check if the difference is greater than or equal to 1 day or if the floor of the difference in hours is greater than or equal to 12 hours
    if (Math.floor(hoursDiff) >= 12) {
        // If either condition is met, return false
   System.debug('hoursDiff>>>>'+hoursDiff);

        return false;
    }

    // If neither condition is met, return true
    return true;
}

    
    
}