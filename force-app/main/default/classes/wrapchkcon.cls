public class wrapchkcon {
//selected names
    List<String> selectednames =new List<String>();
    
    //button
    public void selname()
    {
       
        for(wrapper w: lstwrapper)
        {
            if(w.checked==true)
            {
                selectednames.add(w.names);
            }
        }
        system.debug('************ Selected Names are **********'+selectednames);
       
    }


   //return wrapper
    List<Account> lstdept=new List<Account>();
    List<wrapper> lstwrapper=new List<wrapper>();
    wrapper w;
   
    public List<wrapper> getlstwrapper()
    {
        return lstwrapper;
    }
    
    //wrapchkcon
    public wrapchkcon()
    {
        lstdept=[select Id,name from Account limit 100];
        for(Integer i=0;i<lstdept.size();i++)
        {
        w=new wrapper(lstdept[i].name);
        lstwrapper.add(w);
        }
       
    }
   //wrapper
    public class wrapper
    {
        public String names{get;set;}
        public boolean checked{get;set;}
        public wrapper(String names)
        {
            this.names=names;
            checked=false;
        }
    }
   
}