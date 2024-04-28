public class CustomPathController {
    @AuraEnabled
    public static String getDefaultStepName(String recordId) {
        // Fetch the Opportunity record using the provided recordId
        Opportunity opp = [SELECT Id, Name, StageName FROM Opportunity WHERE Id = :recordId LIMIT 1];
        if (opp != null) {
            return 'Default Value for ' + opp.StageName;
        } else {
            return 'Default Value'; // Return a default value if the Opportunity record is not found
        }
    }
    
    @AuraEnabled
    public static String updateStageValue(String stepName, String recordId) {
        try {
            // Fetch the Opportunity record using the provided recordId
            Opportunity opp = [SELECT Id, Name, StageName FROM Opportunity WHERE Id = :recordId LIMIT 1];
            if (opp != null) {
                opp.StageName = stepName;
               // update opp;
                return 'Stage updated successfully';
            } else {
                return 'Opportunity record not found'; // Return a message if the Opportunity record is not found
            }
        } catch (Exception e) {
            return 'An error occurred: ' + e.getMessage(); // Return an error message if any exception occurs
        }
    }
}