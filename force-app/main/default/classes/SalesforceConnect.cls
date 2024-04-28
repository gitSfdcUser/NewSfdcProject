public class SalesforceConnect {
    public static String getCasesFromSalesforceOrgB(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:SFDCorgB/services/apexrest/CasesTest');
        request.setMethod('GET');
        
        
        //request.setHeader('Authorization', 'Bearer !ARQAQLXrHUaBCHGgMjtbvuQTF8GXrEWNGo3lEyFY_5ABzu2ShpGkcoQLJbucGwabZuXNYoNDOyh3Lu3tpwLRUtfkVNEhKt62');
        
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        system.debug('Response Code>>>'+ response.getStatusCode());
        if(response.getStatusCode() == 200) {
            System.debug(response.getbody());
            return response.getbody();
        }
        return '';
    }
    public static String createCaseToSalesforceOrgB(Case caseObj) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:SFDCorgB/services/apexrest/CasesTest');
        request.setMethod('POST');
        
        // Dynamically create a JSON string based on the case object
        Map<String, Object> jsonMap = new Map<String, Object>();
        
        jsonMap.put('priority', caseObj.Priority);
        jsonMap.put('origin', caseObj.Origin);
        jsonMap.put('status', caseObj.Status);
        jsonMap.put('subject', caseObj.Subject);
        
        
        String requestBody = JSON.serialize(jsonMap);
        request.setBody(requestBody);
        
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        system.debug('Response Code>>>'+ response.getStatusCode());
        if(response.getStatusCode() == 200) {
            System.debug(response.getbody());
            return response.getbody();
        }
        return '';
    }
    
}