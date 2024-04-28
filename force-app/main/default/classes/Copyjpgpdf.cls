@NamespaceAccessible
public class Copyjpgpdf {
@NamespaceAccessible
    public static List<Attachment> createMethod(){
        //creating a list atcNewList 
            List<Attachment> atcNewList=new List<Attachment>();
     //query that account where,it has attachment.   
    Account ac=[Select Id,Name from Account where name ='NewOneoliviaoliviakingkingking' limit 1];
                        System.debug('Account>>>>>'+ ac);

        //null check
        If(ac.Id!=null){ 
            //query attachment which is lookup with Account and create and  initialisating list
            List<Attachment> atcList=[Select id,body,ParentId,name from Attachment where ParentId=:ac.id];
            //query contact which is lookup with Account and create and  initialising list
            List<contact> conlist=[Select id,name from contact where AccountId=:ac.id];
            
            //using for each loop for accessing conlist variable one by one.
            for(Contact con : conlist){
            //using for  each loop for accesing atclist one bye one.   
                for(Attachment at : atcList){
                   //creating new attachment 
                   Attachment a=new Attachment();
                    //cloning/copying the value ehic is in at variable
                    a=at.clone();
                    //assigning parent id of variable a into con variable
                    a.ParentId=con.id;
                    //adding the value of variable a into atcNewList
                    atcNewList.add(a);
                    
                }
            } //checking size check for list atcNewList.
            if(atcNewList.size()>0){
                //creating record 
                insert atcNewList;
                System.debug('parentid>>>>>'+ atcNewList[0].parentId);
            }
        }
        return atcNewList;
    }
}