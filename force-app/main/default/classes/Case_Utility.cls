public with sharing class Case_Utility {
    private static String HANDLER_NAME = 'Case_Trigger_Handler';

    public static void case_insertBypasstrigger() {
       // TriggerHandler.byPass(HANDLER_NAME);

        Case newCase = new Case();
        newCase.Subject = 'new Case Without Trigger';
        insert newCase;
        System.debug('newCase::::'+newCase);

       // TriggerHandler.clearByPass(HANDLER_NAME);
    }
}