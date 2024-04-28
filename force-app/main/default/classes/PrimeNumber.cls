public class PrimeNumber {
    public static Boolean isPrime(Integer num) {
        if (num <= 1) {
            return false;
        }
        for (Integer i = 2; i <= Math.sqrt(num); i++) {
            if (math.mod(num,i) == 0) {
                return false;
            }
        }
        return true;
    }
}