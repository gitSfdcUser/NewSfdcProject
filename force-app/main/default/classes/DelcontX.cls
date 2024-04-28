public class DelcontX {
    public static List <Contact> deletemethod(){
        List<Contact> delList = new List<Contact>();
        try{
        if(account.name!=null){
        delList =[select account.name from contact where account.name like '%a%'];
        System.debug(delList);
         Database.DeleteResult[] drList = Database.delete(delList, false);
            for(Database.DeleteResult dr : drList) {
                if (dr.isSuccess()) {
                    // Operation was successful, so get the ID of the record that was processed
                    System.debug('Successfully deleted account with ID: ' + dr.getId());
                }
                else {
                    // Operation failed, so get all errors                
                    for(Database.Error err : dr.getErrors()) {
                        System.debug('The following error has occurred.');                    
                        System.debug(err.getStatusCode() + ': ' + err.getMessage());
                        System.debug('Account fields that affected this error: ' + err.getFields());
                    }
                }
                
                System.debug(delList);
            } 
        }

}catch(Exception ex){
             System.debug('Exception error occurs:::' +ex.getMessage()+ 'at line no.'+ex.getLineNumber());
        } return delList;
}
}