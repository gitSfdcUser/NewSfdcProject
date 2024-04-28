public class prod {
    public static list<Product2> productmethod(){
        List<Product2>list1=new List<Product2>();
        
        for(Integer i=0;i<10;i++)
        {
            Product2 prod = new Product2();
            prod.Name='smileyballs'+i;
            prod.Description='it will release your stress';
            prod.Family='None';
            
            list1.add(prod);
        }
        insert list1;
        System.debug(list1);
        return list1;
    }
}