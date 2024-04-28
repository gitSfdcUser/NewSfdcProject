public with sharing class Q365_TriggerFrameworkConfig
{
     
    public static Map<SObjectType, List<Type>> getTriggerTypeHandlerClassesMap() {
        return new Map<SObjectType, List<Type>>{
          /*  Account.SObjectType => new List<Type>{
                Q365_AccountFireIntegrationEventsTH.class
            },
            Q365_AccountCreateShpFolder__e.SObjectType => new List<Type>{
                Q365_AccountCreateShpFolderTH.class
            }, */
           Opportunity.SObjectType => new List<Type>{
                Q365_TriggerHandler.class
            }
        };
    }
}