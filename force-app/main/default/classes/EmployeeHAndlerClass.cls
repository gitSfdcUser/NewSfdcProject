public class EmployeeHAndlerClass {
    public static void CheckemployeeStatus(List<Employee__c>OldList){
        for(Employee__c emp: OldList)
            if(emp.IsActive__c==true){
                emp.addError('Active Employee Cannot be Removed');
            }
        
    }

    public static void updateLeftempCountOnAcc(List<Employee__c>oldList){
        set<Id>accIds= new   set<Id>();
        List<Account> accToBeUpdated = new List<Account>(); 
         Map<Id,Account>accIdToAccMap;
        List<Employee__c>empList = new List<Employee__c>();
        Map<Id,Decimal> accIdtoTotalCount = new Map<Id,Decimal>();
        for(Employee__c emp: oldList){
            if(emp.Account__c !=null){
                accIds.add(emp.Account__c);
                    empList.add(emp);
                }
                
            }
            if(accIds.isEmpty()){
                accIdToAccMap=new Map<Id,Account>([select id,name from account
                                                  where Id IN:accIds]);
            }
            
        }
    }