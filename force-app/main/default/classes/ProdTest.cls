@isTest
private class ProdTest {
    @isTest
    private static void ProdTestMethod(){
        Product2 pro = new Product2();
            pro.Name='smileyballs1';
            pro.Description='it will release your stress';
            pro.Family='None';
            insert pro;
        prod.productmethod();
        product2 proNew = [select id,name,description,family from product2 where Id =: pro.id Limit 1];
        System.assertEquals(proNew.name,pro.name);
    }
    

}