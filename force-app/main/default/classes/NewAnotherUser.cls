public class NewAnotherUser {
public static User createMethod(){
     User usrs=new User();
            try{
                Profile proID=new Profile();
                proID=[SELECT id,name from Profile where name ='Identity User' limit 1 ];
                UserRole usrr = new UserRole();
                usrr=[SELECT Id, Name, DeveloperName FROM UserRole where DeveloperName='CEO'];
               
                usrs.Alias='Alias 2';
                usrs.LastName='Last user name';
                usrs.Email='Mkama.yadav@gmail.com';
                usrs.Username='Mkamaa@gmail.com';
                usrs.UserRoleId=usrr.Id;
                usrs.ProfileId = proID.id;
                usrs.EmailEncodingKey='UTF-8';
                usrs.LocaleSidKey='en_US';
                usrs.TimeZoneSidKey='GMT';
                usrs.LanguageLocaleKey='en_US';
                insert usrs;

            } catch (Exception ee){
                System.debug('Line number-->'+ee.getLineNumber()+'\n'+'Error Msg-->'+ee.getMessage());
            } return usrs;
        }
    }