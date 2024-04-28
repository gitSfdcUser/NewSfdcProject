public class CreateLookupContact {
    Public static List<Contact> createLookupmthd(){
        //creating list of contact and account
        List<Contact> ConList = new List<Contact>();
        List<Account> AccList = new List<account>();
        //query account
        AccList=[select id from account limit 10];
        //iterating loop over the size of Acclist
        for(Integer i=0;i<AccList.size();i++){
            Contact con = new Contact();
            con.AccountId=AccList[i].Id;
            con.LastName='HEllo';
            ConList.add(con);
        }
        if(ConList.size()>0){
            insert ConList;
            System.debug(ConList);
            
        }
        return ConList;
    }
    
}