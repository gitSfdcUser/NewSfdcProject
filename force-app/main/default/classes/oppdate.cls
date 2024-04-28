public class oppdate {
    
    public string abc{get;set;}
    public oppdate(ApexPages.StandardController controller) {
        
        opportunity customopp=(opportunity)controller.getRecord();
        system.debug('customopp>>>'+customopp);
        String abc = controller.getId();
        system.debug('abc new>>>'+abc);
        List<opportunity> oppobject =[SELECT id,CloseDate,Stagename FROM opportunity where id = :abc];
    }
}