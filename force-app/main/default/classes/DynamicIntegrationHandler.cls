// Apex class to handle dynamic integration
public class DynamicIntegrationHandler {
    @AuraEnabled
    public static String makeDynamicCallout(String integrationName, Map<String, String> parameters) {
        // Retrieve metadata record based on integrationName
        IntegrationMetadata__mdt metadata = getMetadata(integrationName);
        
        if (metadata != null) {
            // Construct HTTP request dynamically
            HttpRequest req = new HttpRequest();
            req.setEndpoint(metadata.Endpoint__c);
            req.setMethod(metadata.Method__c);
            
            // Parse the JSON string into a Map<String, Object>
            Map<String, Object> headersMap = (Map<String, Object>)JSON.deserializeUntyped(metadata.Header__c);
            
            // Convert the values to strings and store them in a Map<String, String>
            Map<String, String> headers = new Map<String, String>();
            for (String key : headersMap.keySet()) {
                headers.put(key, String.valueOf(headersMap.get(key)));
            }
            // Set headers on the request
            for (String key : headers.keySet()) {
                req.setHeader(key, headers.get(key));
            }
            
            System.debug('headers:::'+headers);
 
            
            // Add parameters to the request body or URL query params
            if (metadata.Method__c == 'POST' || metadata.Method__c == 'PUT') {
                System.debug('parameters'+parameters);
                req.setBody(parameters.get('requestBody'));
            } else if (metadata.Method__c == 'GET' || metadata.Method__c == 'DELETE') {
                // Add query parameters to the URL
            }
            System.debug('req:::::'+req);
            // Make HTTP callout
            Http http = new Http();
            HttpResponse res = http.send(req);
            
            // Handle response
            if (res.getStatusCode() == 200 || res.getStatusCode() == 201) {
                return res.getbody();
            } else {
                System.debug('Other code::::'+res.getStatusCode());
                return '';
                // Error handling
            }
        }
        return '';
    }
    
    private static IntegrationMetadata__mdt getMetadata(String integrationName) {
        // Query metadata record based on integration name
        return [SELECT Id, Endpoint__c, Method__c,Header__c FROM IntegrationMetadata__mdt WHERE DeveloperName = :integrationName LIMIT 1];
    }
}