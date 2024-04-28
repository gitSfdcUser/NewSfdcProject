public class CreateAnoSys {
public static User CreateAdmin(){
     User usrs=new User();
            try{
                Profile proID=new Profile();
                proID=[SELECT id from Profile where Name='System Administrator' limit 1 ];
               
                usrs.Alias='Alias 2';
                usrs.LastName='Last user name';
                usrs.Email='pravi.yadav@gmail.com';
                usrs.Username='pravin@gmail.com';
                
                usrs.ProfileId = proID.id;
                usrs.EmailEncodingKey='UTF-8';
                usrs.LocaleSidKey='en_US';
                usrs.TimeZoneSidKey='GMT';
                usrs.LanguageLocaleKey='en_US';
                insert usrs;

            } catch (Exception ee){
                System.debug('Line number-->'+ee.getLineNumber()+'\n'+'Error Msg-->'+ee.getMessage());
            }
    return usrs;
        }
    }