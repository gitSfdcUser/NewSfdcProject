public class NewCase {
    public static void createMethod(){
        try{
            List<Account> accIdList = new List<Account>();
           accIdList=[select id, (select id from Contacts where id!=null) from account  limit 5];
            
            List<Case> casList = new List<Case>();
            for(Integer i=0;i<5;i++){
                Case Cas= new Case();
                Cas.Status= 'New';
                Cas.Origin= 'Phone';
                Cas.AccountId=accIdList[i].Id;
                CasList.add(Cas);
            }
            insert CasList;
                
            
        }catch(Exception er){
            System.debug('Exception eror'+er);
        }
    }
}