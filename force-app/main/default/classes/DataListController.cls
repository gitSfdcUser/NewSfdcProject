public class DataListController {
    
    List<Account> acc1;
    
    public List<Account>getacc1() {
        return acc1;
    }
    public pageReference acc2(){
        acc1=[select id,name from account Order By Id limit 10 ];
        return null;
    }
      public pageReference acc3(){
        acc1=[select id,name from account Order By Id limit 10 Offset 10];
        return null;
    }
     public pageReference acc4(){
        acc1=[select id,name from account Order By Id limit 10 Offset 20];
        return null;
    }
}