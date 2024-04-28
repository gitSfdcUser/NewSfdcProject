public without sharing class TestNewClass {
    public static void createaccountNow(string naming){
        account acc = new account();
        acc.Name= naming;
        insert acc;
        system.debug('acc'+acc);
    }
}