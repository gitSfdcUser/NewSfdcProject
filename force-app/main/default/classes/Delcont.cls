public class Delcont {
    public static List <Contact> deletemethod(){
        List<Contact> delList = new List<Contact>();
        try{
        if(account.name!=null){
        delList=[select account.name from contact where account.name like '%a%'];
        System.debug(delList);
        delete delList;
        }
        System.debug(delList);
        } catch(Exception ex){
             System.debug('Exception error occurs:::' +ex.getMessage()+ 'at line no.'+ex.getLineNumber());
        } return delList;
    } 

}