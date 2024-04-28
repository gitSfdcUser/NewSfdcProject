@isTest
public class TestTclassDemo{
    @isTest
    private static void warmMethod(){
        Decimal res= TclassDemo.FtoC(70);
        system.assertEquals(21.11,res);
    }
    @isTest
    public static void coldMethod(){
        Decimal res= TclassDemo.FtoC(32);
        system.assertEquals(0,res);
    }
}