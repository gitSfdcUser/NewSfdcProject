public class AccountSelection {
    public string searchVal{get;set;}
    public List<Account>accList{get;set;}
    public void  SearchAcc(){
        String query ='%'+searchVal+'%';
        accList =new List<Account>();
        accList = [select id,name,phone,BillingPostalCode,BillingCity from account Where Name like:query];
    }
}