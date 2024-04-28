public class CustonMandatoryFieldController {
  public Contact con{get;set;}
    public CustonMandatoryFieldController(ApexPages.StandardController controller) {
        con = new Contact();
    }
    public void save(){
        if(con.Firstname == '' || con.Firstname == null){
       ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Please enter Contact name'));
 }
      if(con.Firstname == '' || con.Lastname == null){
       ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Please enter Contact number'));
 }
      if(con.phone == '' || con.phone == null){
       ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Please enter Contact phone'));
    }
else insert con;
    }
}