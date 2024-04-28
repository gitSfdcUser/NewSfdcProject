public class CreateAccountt1 {
    public static void createmethod(){
        List<Account>list1=new List<Account>();
        for(Integer i=0;i<2;i++)
        {
            Account a=new Account();
            a.name='shivam';
            a.AccountNumber='123456789009'+i;
            a.Industry='biotechnology';
            a.Ownership='Public';
            a.Type='Prospect';
            list1.add(a);
        }
        insert list1;
        System.debug(list1);
    }
}