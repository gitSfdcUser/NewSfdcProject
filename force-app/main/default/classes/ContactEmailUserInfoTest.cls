@isTest
private class ContactEmailUserInfoTest {
    @isTest
    private static void ContactEmailUserInfoTestMethod(){
        User  userr = new User();
        userr.Alias='Ikka';
        userr.Email='kim@gmail.com';
        userr.DefaultGroupNotificationFrequency ='N';
        userr.DigestFrequency = 'D';
        userr.EmailEncodingKey ='ISO-8859-1';

        userr.LastName = 'Sunn';
        userr.LocaleSidKey = 'en_US';
        userr.ProfileId = '00e5g000005OcKXAA0';
       userr.TimeZoneSidKey= 'Pacific/Enderbury';
        userr.Username = 'cuterohan@acme.com';

        userr.UserPermissionsCallCenterAutoLogin = true;
        userr.UserPermissionsMarketingUser = false;
        userr.UserPermissionsOfflineUser =true;
userr.LanguageLocaleKey = 'en_US';
  
        insert userr;
        contact con = new contact();
        con.LastName = 'Alias';
        con.Email ='kim@gmail.com';
        insert con;
        ContactEmailUSerInfo.createMethod();
        contact conn =[select id,Email from Contact where Id =: con.Id];
        System.assertEquals(conn.Email, con.Email);
    }
}