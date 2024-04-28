public class Reverseint {
public static Integer reverse(Integer n) {
        Integer r=0;
    
        while(n>0)
        { 
            
         r=(r*10)+ math.mod(n,10);
         n=n/10;
        }
        System.debug(r);
        return r;
        }
    }