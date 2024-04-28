public class SignWellApi {
    Private static final String INTEGRATION_NAME  = 'SignWellApi';
    
    // Call Dynamic Integration Handler
    @AuraEnabled
    public static String sendDocumentForDigitalSign(String parameter){
        System.debug('parameter::::'+parameter);
       // String template_id = '31282531-8bff-4079-8537-6dd142bf64df'
        Map<String,String> paramters  = new Map<String,String>();
              String requestBody = '{"test_mode":true,"draft":false,"with_signature_page":false,"reminders":true,"apply_signing_order":false,"embedded_signing":false,"embedded_signing_notifications":false,"text_tags":false,"allow_decline":true,"allow_reassign":true,"template_id":"' + parameter + '","recipients":[{"send_email":false,"send_email_delay":0,"id":"4","email":"e.awishkark@deaninfotech.com","placeholder_name":"client"}]}';
        paramters.put('requestBody',requestBody);
        String result;
        result = DynamicIntegrationHandler.makeDynamicCallout(INTEGRATION_NAME,paramters);
        System.debug('result:::::'+result);
        return result;
        
    }
}