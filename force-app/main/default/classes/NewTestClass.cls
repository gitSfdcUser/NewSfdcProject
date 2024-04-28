public class NewTestClass{
    public void demoMethod(){

List<Account> ls = new List<Account>{
 new Account(Name='Acme Inc.'),
 new Account(Name='Acme')};
insert ls;
Account masterAcct = [SELECT Id, Name
 FROM Account WHERE Name = 'Acme Inc.'
 LIMIT 1];
Account mergeAcct = [SELECT Id, Name FROM
 Account WHERE Name = 'Acme' LIMIT 1];
try { 
    merge masterAcct mergeAcct;
} catch (DmlException e) {
}


    }
}
