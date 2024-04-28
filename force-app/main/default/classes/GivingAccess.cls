public class GivingAccess {
    public static void testing(){
        
        
        // Get the opportunity record
        Opportunity opp = [SELECT Id, OwnerId FROM Opportunity WHERE Id = '0065g00000TupcKAAR'];
       
        // Create a sharing rule
        OpportunityShare share = new OpportunityShare();
        share.OpportunityId = opp.Id;
        share.UserOrGroupId = '0055g00000HBGk9AAH'; // replace with user or group ID
        share.OpportunityAccessLevel = 'Edit'; // set the access level for the user or group
        
        // Insert the sharing rule
        Database.SaveResult sr = Database.insert(share);
        
        // Check for errors
        if (!sr.isSuccess()) {
            for (Database.Error err : sr.getErrors()) {
                System.debug('Error message: ' + err.getMessage());
            }
        }
    }
}