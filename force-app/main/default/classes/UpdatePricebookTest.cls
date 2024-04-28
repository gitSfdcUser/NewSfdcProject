@isTest
private class UpdatePricebookTest {
    @isTest
    private static void UpdateStandardPriceTest(){
        List<Product2> proList = new List<Product2>();
        product2 pro = new product2();
        pro.name='Toy';
        pro.Family='None';
        proList.add(pro);
        insert proList;
        List<PricebookEntry> PbeNew = UpdatePriceook.UpdateStandardPrice(proList);
        system.assertEquals(PbeNew[0].Product2Id, proList[0].Id);
    }
}