public class CustomerOperationClass {
   static final Double regularCustomerDiscount = 0.1;
   static Double finalPrice = 0;
   
   public static Double provideDiscount (Integer price) {
      //calculate the discount
     final Double regularCustomerDiscount = 0.2;
      finalPrice = price - price * regularCustomerDiscount;
      return finalPrice;
   }
}