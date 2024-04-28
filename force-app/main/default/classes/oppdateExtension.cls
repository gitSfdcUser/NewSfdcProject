public class oppdateExtension {
    
public string abc{get;set;}

public boolean flag{get;set;}

public oppdateExtension(ApexPages.StandardController controller) {

//customcont=(Contact)controller.getRecord();

String abc = controller.getId();

opportunity oppobject =[SELECT id,CloseDate FROM opportunity where id = :abc];

if(oppobject.CloseDate >= Date.Today() && oppobject.CloseDate<= Date.Today().addDays(4))

flag=true;

else

flag=false;

}


}