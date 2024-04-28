public class ContactHandlerTrigger {
    public static void onAfterInsert(List<Contact> newList){
        //set of id
        set<Id> accIds = new set<Id>();
        //List of Account
        List<Account> accToBeUpdated = new List<Account>();
        //Iterating through newlist andf putting AccountID in Set AccId if con.AccountId not null
        for(Contact con: newList ){
            if(con.AccountId != null){
                accIds.add(con.AccountId);
            }
        }
        //Updating Account Id by Invoking  method UpdateAccountName.
        accToBeUpdated=UpdateAccountName(accIds);
        //empty check & updating  record ofaccout if it is not null
        if(!accToBeUpdated.isEmpty()){
            
            update accToBeUpdated; 
        }
    }
    public static void OnAfterUpdate(List<Contact>newList,Map<Id,Contact>oldMap){
         set<Id> accIds = new set<Id>();
        List<Account> accToBeUpdated = new List<Account>();
        for(Contact con: newList ){
            if(con.AccountId != null && con.LastName != oldMap.get(con.Id).Lastname){
                accIds.add(con.AccountId);
            }
        }
        accToBeUpdated=UpdateAccountName(accIds);
        
        if(!accToBeUpdated.isEmpty()){
            update accToBeUpdated; 
        }
    }
    
     

 public static void OnAfterDelete(List<Contact> oldList){
     system.debug('oldlist>>>>>'+oldList);
         set<Id> accIds = new set<Id>();
        List<Account> accToBeUpdated = new List<Account>();
     String delContact='';
        for(Contact con: oldList ){
            if(con.AccountId != null){
                accIds.add(con.AccountId);
               delContact=con.LastName; 
            }
        }
       system.debug('accIds>>>>>'+accIds);
        accToBeUpdated=UpdateAccountNameD(accIds,delContact);
        
        System.debug(accToBeUpdated);
        if(!accToBeUpdated.isEmpty()){
            update accToBeUpdated; 
        }
    }
    public static  List<Account> UpdateAccountNameD(set<Id> accIds,string str){
        system.debug('------str'+str);
        List<Account> accToBeUpdated = new List<Account>();
        Map<Id,String> accIdUpdateAccountName = new Map<Id,String>();
        
        for(contact con: [select id,LastName,AccountId,Account.Name from contact where AccountId IN : accIds]){
           system.debug('containsKey>>>>>'+accIdUpdateAccountName.containsKey(con.AccountId));
            if(accIdUpdateAccountName.containsKey(con.AccountId)){
                system.debug('accIds>>>>>'+accIds);   
                con.Account.Name=accIdUpdateAccountName.get(con.AccountId);
                System.debug('Map---'+accIdUpdateAccountName);
            } if(con.LastName != null){
                system.debug('con.LastName____'+con.LastName);
                String s1 =con.Account.Name;
                String s3=str;
                system.debug('s1>>>'+s1);
                System.debug('s3>>>'+s3);
                String  s2 = s1.remove(s3);
                system.debug('s2>>>'+s2);
                con.Account.Name=s2;
                
                system.debug('con.Account.Name>>>>'+con.Account.Name);
                
            }
            accIdUpdateAccountName.put(con.AccountId,con.Account.Name);
            
        } if(!accIdUpdateAccountName.isEmpty()){
            system.debug(accIdUpdateAccountName);
            for(id i: accIdUpdateAccountName.keySet()){
                Account acc= new Account();
                acc.Id=i;
                acc.Name=accIdUpdateAccountName.get(i);
                accToBeUpdated.add(acc);
            }system.debug('accToBeUpdated>>'+accToBeUpdated);
        }
        return accToBeUpdated;

}
    
   // Creating a method which name is UpdateAccountName and passing parameter as set<id>accID
    public static  List<Account>UpdateAccountName(set<Id> accIds){
        //List of Account
        List<Account> accToBeUpdated = new List<Account>();
        //Map of AccIdUpdatedName(id,updated name(string)).
        Map<Id,String> accIdUpdateAccountName = new Map<Id,String>();
      //  iterating  through that contact whose account id present in accids
        for(contact con: [select id,LastName,AccountId,Account.Name from contact where AccountId IN : accIds]){
           //Checking accIdUpdateAccountName map have key id same as contact account id or not 
            if(accIdUpdateAccountName.containsKey(con.AccountId)){
                //If yes then,Contact Account Name  must be same as accIdUpdateAccountName as Contact Account id
            con.Account.Name=accIdUpdateAccountName.get(con.AccountId);
                //Checking Map
                System.debug('Map---'+accIdUpdateAccountName);
                
        }
            // Chewcking Contact name is Null Or not
            if(con.LastName != null){
            system.debug(con.LastName);
                //con.Account name must be contact accoount name concatened with contact lastName 
        con.Account.Name=con.Account.Name + con.LastName;
             system.debug(con.Account.Name);
        }
           // Put Contact AccountId as Kwey And AccountNAme a sValue in that Map
        accIdUpdateAccountName.put(con.AccountId,con.Account.Name);
           //If MAp is not empty then,
    } if(!accIdUpdateAccountName.isEmpty()){
         system.debug(accIdUpdateAccountName);
       // iterate on map keyset whhic is id  to values as following
        for(id i: accIdUpdateAccountName.keySet()){
           // creating a new instance of account 
            Account acc= new Account();
            //Puttng AccId into variable i 
            acc.Id=i;
           // Account id name should be  Map accid whis is as i variable now
            acc.Name=accIdUpdateAccountName.get(i);
            //addding values to List accToBe Updated
            accToBeUpdated.add(acc);
        }system.debug(accToBeUpdated);
    }
        //And return it to other method 
return accToBeUpdated;

}

}