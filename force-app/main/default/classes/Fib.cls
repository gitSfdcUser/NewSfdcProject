public class Fib {
    public static integer fibo(Integer n){
        Integer a=0,b=1,c,i;
        System.debug(a);
        System.debug(b);
        for(i=1;i<=n-2;i++)
        {
            c=a+b;
            a=b;
            b=c;
        }
        system.debug(c);
        return c;
    }
    
}