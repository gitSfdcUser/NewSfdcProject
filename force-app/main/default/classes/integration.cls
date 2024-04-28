public class integration {
    public static void AccountExtmethod(){
        
        //Add bulk data on awishkar Org
        List<Dano__Account__x> accxList = new List<Dano__Account__x>();     
        
        for(integer i=0;i<10;i++){
            Dano__Account__x accx = new Dano__Account__x();
            accx.Dano__Name__c = 'NewWorkOf Mine>>>>>>>'+i;
            accx.Dano__NumberOfEmployees__c =10;
            accxList.add(accx);
        }
        
        
        Database.insertImmediate(accxList, accessLevel.SYSTEM_MODE);
        System.debug('accxList>>>>>'+accxList);
        
    }
    //Add bulk data on awishkar Org
    
    public static void AccountExtDelete(String name){
        try{
            
            
            String queryName = '%' + name + '%';
            String query1 = 'SELECT Dano__Name__c FROM Dano__Account__x where Dano__Name__c like'+'\''+ queryName + '\''+'Limit 1';
            System.debug('query1>>>>'+query1);
            List<Dano__Account__x> accountRecords = Database.query(query1);
            System.debug('Dano__Account__x>>>>>>>>'+accountRecords);
Database.deleteImmediate(accountRecords);       
    }  catch(exception e){
            System.debug('Here IS an Exception>>>>'+e.getMessage()+'line no.>>>>'+e.getLineNumber());
        }   
    }
    
    
    
    public static void AccountExtUpdate(String name){
        try{
            
            List<Dano__Account__x> UpdatedRecords = new List<Dano__Account__x>();
            
            String queryName = '%' + name + '%';
            String query1 = 'SELECT Dano__Name__c FROM Dano__Account__x where Dano__Name__c like'+'\''+ queryName + '\''+'Limit 1';
            System.debug('query1>>>>'+query1);
            List<Dano__Account__x> accountRecords = Database.query(query1);
            System.debug('Dano__Account__x>>>>>>>>'+accountRecords);
            for (Dano__Account__x record : accountRecords) {
                SYstem.debug('I am here '+record);
                
                record.Dano__Name__c = 'Updated'+record.Dano__Name__c;
                UpdatedRecords.add(record);             
            }
            Database.updateImmediate(UpdatedRecords);
            System.debug('UpdatedRecords>>>>>'+UpdatedRecords);
        }  catch(exception e){
            System.debug('Here IS an Exception from update method>>>>'+e.getMessage()+'line no.>>>>'+e.getLineNumber());
        }   
        
    }
    
}