@isTest
public class TestDataFactory {
    //Account object data 
    public static List<account> CreateAccData(Integer NumAcc){
        List<account>lstAcc = new List<account>();
        for(integer i=0; i<NumAcc; i++){
            Account acc = new Account();
            acc.Name = 'TestDataFactoryAccount'+i;
            acc.Description = 'TestDataFactoryAccount'+i+'Description';
            lstAcc.add(acc);
        }
        System.debug('lstAcc>>>'+lstAcc);
        if(lstAcc.size()>0){
            upsert lstAcc;
            
        }
        return lstAcc;
    }
    public static List<Lead> CreateLeadData(Integer NumAcc){
        List<Lead>lstLe = new List<Lead>();
        for(integer i=0; i<NumAcc; i++){
            Lead Le = new Lead();
            Le.LastName = 'TestDataFactoryLead'+i;
            Le.Company = 'TestDataFactoryLead'+i+'Company';
            Le.Status = 'working - contacted';
            Le.Fax = '101901910';
            lstLe.add(Le);
        }
        System.debug('lstLe>>>'+lstLe);
        if(lstLe.size()>0){
            upsert lstLe;
            
        }
        return lstLe;
    }
    
}