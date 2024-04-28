public class CurrentApp {
    public static void CurrentMethoodApp(){
        String userId = UserInfo.getUserId();

// Get the UserAppInfo for the current user
UserAppInfo userAppInfo = [SELECT Id, AppDefinitionId
                           FROM UserAppInfo
                           WHERE UserId = :userId LIMIT 1];

// Get the AppDefinition for the app used by the current user
AppDefinition appDefinition = [SELECT DurableId, Label
                               FROM AppDefinition
                               WHERE DurableId = :userAppInfo.AppDefinitionId LIMIT 1];

System.debug('The current user is using app: ' + appDefinition.Label);

    }
}