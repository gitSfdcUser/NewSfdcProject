// Test for the post install class
@isTest
private class NewPostPackageInstallTest {
    @isTest           
    public static void test() {
      NewPostPackageInstall myClass = new NewPostPackageInstall();
      Test.testInstall(myClass, null);
    }
}