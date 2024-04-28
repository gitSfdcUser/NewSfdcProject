public class NewCaseId {
    public static Case getCaseByRecord(){
        case MyCase = [Select Fields(standard) from case where id ='5005g00000erKyLAAU' limit 1];
System.debug('cs>>>>'+MyCase);
    return MyCase;
    }
    public static void SalesfoceGet(){
        case MynewCase = getCaseByRecord();
        System.debug(MynewCase);
    }
    
}