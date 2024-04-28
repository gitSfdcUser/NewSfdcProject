public class LearningApex {
    public static void methodName(Integer i){
        
        Integer sign;
        switch on i {
            when 2,7 {
                System.debug('when block 2 $ 7');
            }
            when -3,10{
                System.debug('when block -3');
            }
            when else {
                System.debug('default');
            }
        }
        
    }
    
    public static void MappingTest()
    {
        
        // Map<String,String>StrMap = new Map<String,String>{'Key 1' => 'Value1','Key 2' => 'MapValue2'};
        //     Map<String,String>StrMap2 = new Map<String,String>(StrMap);
        // System.debug('StrMap>>>>>'+StrMap);
        // System.debug('StrMap2>>>>>'+StrMap2);
        
        
        //     List<Account> accList = [Select Id,name,Industry,Type from Account limit 5];
        //     System.debug('accList>>>'+accList);
        //     Map<Id,sObject> accountMap = new Map<Id,sObject>(accList);
        //     System.debug('accountMap>>>'+accountMap);
        //     accountMap.clear();
        //     System.debug('accountMap>>>'+accountMap);
        
        //     Map<String,String>Map1 = new Map<String,String>{'Key 1' => 'Value1','Key 2' => 'MapValue2'};
        //  Map<String,String>Maptest = new Map<String,String>{'Key 1' => 'Value1','Key 2' => 'MapValue2'};
        
        //     Map<String,String>Map2 = Map1.clone();
        //     System.debug(Map2);
        //  Boolean Check1 =    Map1.containsKey('Key 3');
        //  System.debug('Check1>>>'+Check1);
        
        //      Boolean Check2 =    Map1.equals(Maptest);
        //         System.debug('Check2>>>'+Check2);
        
        //   String st2 =  Map1.get('Key 1');
        //         System.debug('Values>>>'+st2);
        
        //  Map1.clear();
        
        //  Boolean nullCheck =  Map1.IsEmpty();
        //     System.debug('Nullcheck>>>'+nullCheck);
        //     Set<String> TestSet = Maptest.keySet();
        //                 System.debug('TestSet>>>'+TestSet);
        // Maptest.put('NewPutKey','PutValue');
        //                         System.debug('Maptest>>>'+Maptest);
        
        
        //         Map<String,String>CopyMap1 = new Map<String,String>();
        // CopyMap1.put('Map1','Mp2');
        //        System.debug('CopyMap1>>>'+CopyMap1);
        
        // CopyMap1.putAll(Maptest);
        //        System.debug('CopyMap1>>>'+CopyMap1);
        
        
        // List<Account> accList = [Select Id,name,Industry,Type from Account limit 5];
        // System.debug('accList>>>'+accList);
        // Map<Id,sObject> accountMap = new Map<Id,sObject>();
        // accountMap.putAll(accList);
        // System.debug('accountMap>>>'+accountMap);
        
        Map<String, String> CopyMap1 = new Map <String,String>();
        CopyMap1.put('TestKey1','TestKeyValue1');
        CopyMap1.put('Test2K','Testkey1X');
        System.debug('CopyMap1:::'+CopyMap1);
        
        String CheckTest = CopyMap1.remove('Test2K');
        System.debug('CheckTest:::'+CheckTest);
        System.debug('CopyMap1:::'+CopyMap1);
        System.debug('mapSize>>>'+CopyMap1.Size());
        System.debug('mapValues>>>>'+CopyMap1.Values());
        
    }
    
    Public static void DeleteDuplicateRecords(){
        List <Opportunity> oppList = [SELECT Id, TotalOpportunityQuantity, CloseDate, Type, NextStep FROM Opportunity];
    }    
    
    public static void createBulkAccount(){
        List<Account> accList = new List<Account>();  
        System.debug(accList); 
        for(integer i = 0 ; i<2; i++)
        {
         Account acc = new Account();
         acc.name = 'Arj'+i;
         acc.AccountNumber = 'Test123@';
         System.debug('acc'+acc);
         accList.add(acc);
         System.debug('accList'+accList);
         
        }
        System.debug('accList'+accList);
        
    }
    
    
    
    
}