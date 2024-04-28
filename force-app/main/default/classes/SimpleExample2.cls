public class SimpleExample2 {
 public List<String> fields {set;get;}
    public SimpleExample2(){
//   Schema.SObjectType
//   Schem.SobjectField
//   Fetch the Properties Of  a Object    
        
        Schema.DescribeSobjectresult result = Account.SObjectType.getDescribe();
        //Create a Map with field Name As Key and Value As  value 
        //In desscription Of Sobject we have Fields Atttribute 
        Map<String,Schema.SObjectField> fldMap = result.fields.getMap();
        Set<String> Keys = fldMap.keySet(); //This Will return All the Field NAmes 
        fields=new List<String>(Keys);
        
    }
}