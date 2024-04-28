public class AccountHierarchyTree {
    public string searchVal{get;set;}
    public List<Account>NewaccList{get;set;}
    public List<Account>accList{get;set;}
    public void  SearchAcc(){
        String query ='%'+searchVal+'%';
        accList =new List<Account>();
        accList = [Select id,Phone,name, (Select id,Name From ChildAccounts) From Account where name like:query limit 1];
    
        NewaccList =new List<Account>();
        for(account acc: accList){
            for(account newacc: acc.ChildAccounts){
               NewaccList.add(newacc);
            }
        }
    }
}