public class RelatedListController {
    private final Account account;
    public List<Contact> relatedContacts { get; private set; }
    
    public RelatedListController(ApexPages.StandardController controller) {
        this.account = (Account)controller.getRecord();
        this.loadRelatedContacts();
    }
    
    private void loadRelatedContacts() {
        relatedContacts = [SELECT Id, Name, Email FROM Contact WHERE AccountId = :account.Id];
    }
}