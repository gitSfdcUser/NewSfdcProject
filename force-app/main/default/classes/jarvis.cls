public class jarvis {
    public static void run1MinLaterScheduleJob(){
        
      
       datetime thisTime = system.now().addMinutes(1);
          // this section of code will schedule the next execution 1 minute from now 
       integer minute = thisTime.minute(); 
        integer second = thisTime.second(); 
        integer hour = thisTime.hour(); 
        integer year = thisTime.year(); 
        integer month = thisTime.month(); 
        integer day = thisTime.day(); 
        
        String timeStamp = second + ' ' + minute + ' ' + hour + ' ' + day + ' ' + month + ' ? ' + year; 
        string jobName = 'reco job';
        
       // MyscheduleJob rsj = new MyscheduleJob(); 
       // system.schedule(jobName, timeStamp , rsj);
        
    }
}