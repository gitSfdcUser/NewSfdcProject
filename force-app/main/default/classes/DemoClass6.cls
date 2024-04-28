public class DemoClass6 {
    public static void myMethod(String Power){
        System.debug('World One>>>'+Power);
    }
public static String myMethod2(){
        user us = [select id,name from user limit 1];
String profile = us.name;
    return profile;
    }



}