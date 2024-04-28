public class UpdateOpp {
    public static void createmethod(){

List<Opportunity>list1=new List<Opportunity>();
        list1=[Select Name,Id,CloseDate from opportunity];
        System.debug('Lt-'+list1);
        Date myDate = Date.newInstance(2022, 9, 19);
        Date newDate = myDate.addDays(3);
        System.debug(newDAte);
        for(Integer i=0;i<list1.size();i++){
        list1[i].CloseDate=newDate;
 
        list1[i].Name = 'Game' +list1[i].name;
        }
        System.debug('Lt2-'+list1);
        update list1;
        System.debug('Updated list'+list1);
        
        
    }
    
}