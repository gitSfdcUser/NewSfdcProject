public class ContactEmailUSerInfo{

    public static void createMethod(){
        
{
    //query list of contact
List<contact> conlist=[select id,name,Email from contact];
    //checking one by one email associated by email is same with user email or not.
for(contact con:conlist)
{
if(con.Email==UserInfo.getuserEmail())
{
    //it is matched,then we debug it.
system.debug('contact='+con);
}
}
}
}

}