@isTest
private class CreateAnoSysTest {
    @isTest
    private static void CreateAnoSysTest(){
        User result = CreateAnoSys.CreateAdmin();
        System.assertEquals('Alias 2', result.Alias);
    }
    @isTest
    Private static void NewAnotherUserTest(){
        User result = NewAnotherUser.createMethod();
         System.assertEquals('Alias 2', result.Alias);
    }
    
    
}