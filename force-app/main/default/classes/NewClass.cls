public class NewClass {
   public static List<Account> getHierarchyAccounts(Id accountId) {
    List<Account> accounts = new List<Account>();
    accounts.add([SELECT Id, Name, ParentId FROM Account WHERE Id = :accountId]);

    List<Account> childAccounts = [SELECT Id, Name, ParentId FROM Account WHERE ParentId = :accountId];
    for (Account childAccount : childAccounts) {
        accounts.addAll(getHierarchyAccounts(childAccount.Id));
    }
system.debug('accounts>>>>'+accounts);
    return accounts;
}
    
}