@isTest
private class StartEndDAteTest {
    @isTest
    private static void StartEndDAteTestMethod(){
        String Result = StartEndDAte.createmethod();
        system.system.assertEquals('0Year-2Month3Day\n1Hour1Minute0Second', Result);
        
    }

}