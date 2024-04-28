public class IntegrationTesterClass {
    public static void CalloutFromApex(){
        // Define the endpoint URL
        String endpointUrl = 'https://www.signwell.com/api/v1/document_templates/documents';
        
        // Define the request body if needed
        String requestBody = '{"test_mode":true,"draft":false,"with_signature_page":false,"reminders":true,"apply_signing_order":false,"embedded_signing":false,"embedded_signing_notifications":false,"text_tags":false,"allow_decline":true,"allow_reassign":true,"template_id":"31282531-8bff-4079-8537-6dd142bf64df","recipients":[{"send_email":false,"send_email_delay":0,"id":"4","email":"e.awishkark@deaninfotech.com","placeholder_name":"client"}]}';
        
        // Define the headers
        Map<String, String> headers = new Map<String, String>{
            'Content-Type' => 'application/json',
                'accept' => 'application/json',
                'X-Api-Key' => 'YWNjZXNzOmRkZjgxZTg5NDIxNTVjMzU5MzE5N2FlYjkyY2JkMzdm'
                };
                    
                    // Create the HTTP request
                    HttpRequest request = new HttpRequest();
        request.setEndpoint(endpointUrl);
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json');
        request.setBody(requestBody);
        
        // Set additional headers
        for (String key : headers.keySet()) {
            request.setHeader(key, headers.get(key));
        }
        
        // Create the HTTP instance
        Http http = new Http();
        System.debug('request:::'+request);
        // Send the request and get the response
        HttpResponse response = http.send(request);
        
        // Display the response
        System.debug('Response Status: ' + response.getStatus());
        System.debug('Response Body: ' + response.getBody());
        
    }
}