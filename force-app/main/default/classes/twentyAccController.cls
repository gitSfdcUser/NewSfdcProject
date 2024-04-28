public class twentyAccController {
    public List<Account>accountList{get;set;}
    public twentyAccController(){
        accountList = [select id,name,website from Account limit 20];
    }
}