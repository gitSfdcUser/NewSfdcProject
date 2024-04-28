public class AccountController {
    public Account accountRecord { get; set; }
    
    public AccountController() {
        accountRecord = new Account();
        accountRecord.Name = 'Sample Account'; // Set the desired account name here
    }
    
    public void performAccountInsertion() {
        insert accountRecord;
    }
}