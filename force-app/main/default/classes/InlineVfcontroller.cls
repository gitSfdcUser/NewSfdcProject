public class InlineVfcontroller {
      private final Opportunity acct;
    public  string error;
        public string myProperty { get; set; }

 public ApexPages.StandardSetController stdCntrlr {get; set;}

 public InlineVfcontroller(ApexPages.StandardSetController controller) {

        stdCntrlr = controller;
    }
 public pagereference DisplayError(){
pagereference redirect = new PageReference('/apex/ErrorPage');
       
redirect.setRedirect(true);
system.debug('Hello@@'+redirect);
return redirect;
}
    
  public void DisplayTest(){

system.debug('Hello@@I am display test');
}
    
 public string getMyProperty() {
        string t = 'hdhhfjshjdbvjdb';
        return t;
    }  
     public InlineVfcontroller() {
        myProperty = 'hdhhfjshjdbvjdb';
    }
    
    
}