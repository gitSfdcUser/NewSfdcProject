public class SimpleExample {
    public Map<String,Object> resMap {set;get;}
    public SimpleExample(){
        //Schema.DescribeSobjectresult :this class will contain  the metjods required the returned  the properties of given result 
        
        Schema.DescribeSobjectresult result = Account.SObjectType.getDescribe();
        resMap = new Map<String,Object>();
        
        resMap.put('LAbel',result.getLabel());
        resMap.put('Name',result.getName());
        resMap.put('Create',result.isCreateable());
        resMap.put('Read',result.isAccessible());
        resMap.put('Update',result.isUpdateable());
        resMap.put('delete',result.isDeletable());
        resMap.put('undelete',result.isUndeletable());
        resMap.put('Custom',result.isCustom());
        resMap.put('CustomSetting',result.isCustomSetting());
        resMap.put('MRU',result.isMruEnabled());
        resMap.put('Query',result.isQueryable());
        resMap.put('Feed',result.isFeedEnabled());
        resMap.put('code',result.getKeyPrefix());

        
        
    }
}