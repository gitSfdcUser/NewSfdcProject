public class objectComboBoxController {
    @AuraEnabled
    
    public static Map<String,string>getAllObjectList(){
        Map<String,string> mapOfAllObject = new  Map<String,string>();
        for(schema.SObjectType objTyp: Schema.getGlobalDescribe().values()){
            string name  = objTyp.getDescribe().getLocalName();
            string label =objTyp.getDescribe().getLabel();
            mapOfAllObject.put(Name, label);
            system.debug('mapOfAllObject>>>>'+mapOfAllObject);
        }
        return mapOfAllObject;
    }
    
    //this is for getting our field list
    
    
    @AuraEnabled
    public static Map<String,String> getPicklistTypeFields(String strObjectName) {
        Map<String, Schema.SObjectType> detail = Schema.getGlobalDescribe();
        Map<String,String> mapAllFields = new  Map<String,String>();
        for(Schema.SObjectField fields :detail.get(strObjectName).getDescribe().fields.getMap().Values()) {
            mapAllFields.put(fields.getDescribe().getName() , fields.getDescribe().getName());
        }
    return mapAllFields;
}



}