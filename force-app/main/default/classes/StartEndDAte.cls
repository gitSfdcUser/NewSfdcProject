public class StartEndDAte {
    public static String createmethod(){
        Map<String, Integer> mon= new Map<String, Integer>();
        /* mon.put('jan',1);
mon.put('feb',2);
mon.put('mar',3);
mon.put('apr',4);
mon.put('may',5);
mon.put('jun',6);
mon.put('jul',7);
mon.put('aug',8);
mon.put('sep',9);
mon.put('oct',10);
mon.put('nov',11);
mon.put('dec',12);
system.debug(mon);*/
        DateTime Startdate=DateTime.newInstance(2016,12,02,6,7,55);
        DateTime enddate=DateTime.newInstance(2016,10,05,7,8,55);
        System.debug('StartDate  '+Startdate);
        system.debug('EndDate   '+enddate);
        Integer Year= enddate.Year()-Startdate.Year();
        System.debug('Year_'+Year);
        Integer Month= enddate.Month()-Startdate.Month();
        System.debug('Month_'+Month);
        Integer Day= enddate.Day()-Startdate.Day();
        System.debug('Day_'+Day);
        Integer Hour =enddate.Hour()-Startdate.Hour();
        System.debug('Hour_'+Hour);
        Integer Minutes =enddate.Minute()-Startdate.Minute();
        System.debug('Minutes_'+Minutes);
        Integer Second =enddate.second()-Startdate.second();
        System.debug('second_'+Second);
        
        String Duration = Year+'Year'+Month+'Month'+Day+'Day\n'+Hour+'Hour'+Minutes+'Minute'+Second+'Second';
        system.debug('>>>>>'+Duration);
        return Duration;
    }
    
}