public with sharing class ContactController {
    public Contact c { get; set; }
    public List<Contact> samepage { get; set; }
    
    public ContactController(){
        c = new Contact();
        c.FirstName = 'Working here';
    }

    public PageReference save() {
        insert c;  
        samepage = [SELECT Id, FirstName, LastName, Email, Birthdate FROM Contact WHERE Id = :c.Id];
        return null;
    }
    
    public void PhoneHelpText() {
        // Additional processing to handle line breaks
        // Replace line breaks with a special character sequence
        c.FirstName = c.FirstName.replace('\n', '@@LB@@').replace('\r\n', '@@LB@@');
        System.debug('PhoneHelpText: ' + c.FirstName);
    }
    
    public String restoreLineBreaks(String input) {
        // Restore line breaks from the special character sequence
        return input.replace('@@LB@@', '\n');
    }
    
    public PageReference saveWithLineBreaks() {
        // Restore line breaks from the special character sequence before saving
        c.FirstName = restoreLineBreaks(c.FirstName);
        
        insert c;  
        samepage = [SELECT Id, FirstName, LastName, Email, Birthdate FROM Contact WHERE Id = :c.Id];
        return null;
    }
}