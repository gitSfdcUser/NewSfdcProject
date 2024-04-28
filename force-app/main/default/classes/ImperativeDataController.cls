public class ImperativeDataController {
 @AuraEnabled(cacheable=true)
    public static list<Opportunity>getOppList(string searchKey){
        //if search function
        if(searchKey != null && searchKey !=''){
            string key='%'+searchKey+'%';
            System.debug('searchKey'+searchKey);
              List<Opportunity> OppListSearch =[Select id,name from Opportunity where name like : key ];
             System.debug('OppListSearch>>'+OppListSearch);
            return OppListSearch;
          
        }
        else{
             List<Opportunity> OppList =[Select id,name from Opportunity];
        System.debug('OppList>>'+OppList);
            if(!OppList.isEmpty()){
                        return OppList;

            }
        return null;
        }
       
    }
    
    
    
}