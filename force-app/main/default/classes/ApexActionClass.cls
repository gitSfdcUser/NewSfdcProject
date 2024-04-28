public class ApexActionClass {
    @InvocableMethod(label='Flow for Passing Id' description ='We are tring to fetch id of conteent Dociment ' category='Account')
    public static void ApexActionClass(List<String>IDs){
        SYstem.debug('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
        SYstem.debug('debug>>>>>>>>>>>>>>>'+IDs);
    }
}