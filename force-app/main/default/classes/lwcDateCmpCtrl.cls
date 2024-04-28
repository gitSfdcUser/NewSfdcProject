public with sharing class lwcDateCmpCtrl {
  @AuraEnabled
  public static Account submitROAction(String roAmount,Date roDate){
      Account pubObj = new Account();
      pubObj.Name=roAmount;
   
    insert pubObj;
    system.debug('pubObj@@@ ' + pubObj);
    return pubObj;
  }
 
  @AuraEnabled
  public static List<Account> searchRoItem(Date dateStr1, Date dateStr2){
    
    List<Account> roPublisherObj = [Select Id, Name From Account where CreatedDate >:dateStr1 and CreatedDate <:dateStr2];
     system.debug('roPublisherObj ' + roPublisherObj);
     
      return roPublisherObj;
  }
 
}