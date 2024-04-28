public with sharing class Q365_DependencyInjectorConfig
{
    /* Returns implementation class suffixes according to the effective naming convention.
        Note: method shall return an empty list if there are no naming conventions for implementation classes. */
    public static List<String> getImplementationClassNameSuffixes() {
        return new List<String>{ 'Impl' };
    }

    public static Map<Type, Type> getTypeResolveMap() {
        return new Map<Type, Type> {
           Q365_TriggerFramework.class => Q365_TriggerFrameworkImpl.class
             /*Q365_O365MetadataService.class => Q365_O365MetadataServiceImpl.class,
            Q365_MicrosoftGraphApiService.class => Q365_MicrosoftGraphApiServiceImpl.class,
            Q365_IntegrationConfig.class => Q365_IntegrationConfigImpl.class,
            Q365_IntegrationStateLogService.class => Q365_IntegrationStateLogServiceImpl.class,
            Q365_SharepointFilesService.class => Q365_SharepointFilesServiceImpl.class 
*/
        };
    }
}