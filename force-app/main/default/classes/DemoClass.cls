public class DemoClass {
    public static void PrintHello(){
        string exp = 'PrintHello in Anonymous';
        for(integer i=0;i<10;i++){
            System.debug(exp);
            
        }
    }
    
    
    public static void TestMethod1(){
        List<String> StrList = new List<String>{'Test1','Rahul','Testr','Shweta','Test','Ravi','Tst45453','Test','Testing','Tst23232'};
        List<contact> conList = new List<contact>();
            for(String str :StrList){
                Contact con = new contact();
                con.LastName = str;
                conList.add(con);
            }
                        insert conList;
                System.debug(conList);

    }
}