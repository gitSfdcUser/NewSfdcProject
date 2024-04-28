public with sharing class RecordCreationClass {
    public RecordCreationClass() {

    }
        // create Sobject record
    public static sObject  createSObjectRecordMethod(String SobjectTypeName, boolean create){
        Account acc =new account();
if(SobjectTypeName == 'Account'){
   acc.Name = 'Dummy Account Created';
   }
   if(create){
    insert acc;
   }else {
    return acc;
   }
   return null;
    }
}