public class NewWork {
    public static void CreateAccount(){
        
        
       
        List<Account>Acclist=new List<Account>();
        for(Integer i=0;i<2;i++){
            Account acc = new Account();
            acc.BillingCity='California';
            acc.Name='Shyam';
            acc.Rating='Hot';
            acc.Ownership='Public';
            acc.Type='Propect';
            Acclist.add(acc);
            System.debug(Acclist);
        }if(Acclist.size()!=null){
            
            
            insert Acclist;
            System.debug(Acclist);
        }
    }
    
     /*
    public static void createContactMethod(){
        List<Contact> ConList= new List<Contact>();
        List<Account>AccList=new List<Account>();
        AccList=[SELECT id,name from Account limit 2];
        for(Integer i=0;i<2;i++){
            contact con= new contact();
            con.LastName='Sarthak';
            con.AccountId=AccList[i].id;
            ConList.add(con);
            
        }
        if(ConList.size()!=0){
            insert ConList;
            System.debug(ConList);
            
        }
    }
    public static void createOpportunityMethod(){
        List<Opportunity> Opplist=new List<Opportunity>();
        for(Integer i=0;i<2;i++){
            Opportunity opp = new Opportunity();
            opp.CloseDate=System.today();
            opp.StageName='Prospecting';
            opp.Name='Aspirant';
            Opplist.add(opp);
        }
        if(Opplist.size()!=0){
            insert Opplist;
        }
    }
    public static void createProductMethod(){
        List<Product2> ProList= new List<Product2>();
        for(Integer i=0;i<2;i++){
            product2 pro = new product2();
            pro.Name='Salesbook';
            Pro.Description='this is a book for salesman';
            Pro.Family='None';
            ProList.add(Pro);
            
        }if(ProList.size()!=0){
            insert Prolist;
            System.debug(ProList);
        }
    }
    public static void deleteAccountMethod(){
        List<Account> AccList=new List<Account>();
        AccList=[select id,name from account where name like'%a%' And name!='test1rahul' limit 4];
        System.debug(AccList);
        if(AccList.size()!=0){
            delete AccList;
            system.debug(AccList);
        }
    }
    public static void UpdateOpportunityList(){
        List<Opportunity> OppList = new List<Opportunity>();
        
        OppList=[select id,name,Closedate from Opportunity];
        Date myDate=System.Today();
        Date futureDate= myDate.adddays(3);
        for(Opportunity Opp: OppList){
            Opp.Name =Opp.Name+'F';
            Opp.CloseDate=futureDate;
        }
        if(OppList.size()!=null){
            Update OppList;
            System.debug(OppList);
        }
    }
    
    public static void welcomeMethod(){
        System.debug('Welcome to Salesforce');
    }
    
    public static void UserInformationMethod(){
        System.debug('User name info=>'+UserInfo.getName());
        System.debug('User enmail info=>'+UserInfo.getUserEmail());
        System.debug('User phone info=>'+UserInfo.getUserId());
    }
    
    public static String RevString(String parameter){
        String rev =parameter.reverse();
        return rev;
    }
    public static void PfAcnameAsc(){
        list<Account>listaccount=new List<Account>();
        listaccount=[SELECT id, name
                     FROM Account
                     ORDER BY name Asc];
        System.debug(listaccount);
        
    }
    public static void fibo(Integer n){
        Integer i,a=0,b=1,c=0;
        System.debug(a);
        
        for(i=2;i<=n-2;i++){
            a=b;
            b=c;
            c=a+b;
            
            
            System.debug(c);
        }
        
    }
    public static void RevInt(Integer n){
        Integer r=0;
        
        while(n>0)
        { 
            
            r=(r*10)+ math.mod(n,10);
            n=n/10;
        }
        System.debug(r);
        
    }
    public static void proddescMethod(){
        list<Product2>productlist=new list<Product2>();
        productlist=[SELECT id, name
                     FROM Product2 where description like'%a%'];
        
        System.debug(productlist);
        
    }
    public static void StartEndDate(){
        Map<String,integer>mon= new Map<String,integer>();
        mon.put('jan',1);
        mon.put('feb',2);
        mon.put('march',3);
        mon.put('April',4);
        mon.put('may',5);
        mon.put('june',6);
        mon.put('july',7);
        mon.put('august',8);
        mon.put('September',9);
        mon.put('october',10);
        mon.put('november',11);
        mon.put('December',12);
        System.debug(mon);
        DateTime StartDate = DateTime.newInstance(2016,mon.get('jan'), 2, 6, 7, 55);
        DateTime EndDAte = DateTime.newInstance(2016,mon.get('feb'), 5, 7, 8, 55);
        System.debug(StartDate);
        System.debug(EndDate);
        Integer year=StartDAte.year()-EndDate.year();
        Integer month=Startdate.Month()-Enddate.Month();
        Integer day=Startdate.day()-Enddate.day();
        Integer hour=Startdate.hour()-Enddate.hour();
        Integer minute=Startdate.minute()-Enddate.minute();  
        Integer second=Startdate.second()-EndDate.second();
        System.debug('duration ='+year+'year'+month+'month'+day+'day'+hour+'hour'+minute+'minute'+second+'second');
    }
    //algoPricebook
    
    
    public static void AlgoPricebook(){
        //create a pricebook
        Pricebook2 Algo =new Pricebook2();
        Algo.Name='pricebookji';
        Algo.IsActive=true;
        Algo.Description='Real one';
        insert Algo;
        //query
        Pricebook2 spb= new Pricebook2();
        spb=[select id,name from Pricebook2 where isStandard=true limit 1];
        //creating product
        List<Product2> ProList= new List<Product2>();
        for(Integer i=0;i<10;i++){
            Product2 pro=new product2(); 
            pro.Name='Algevo';
            pro.Description='dshajksdfiejfcieodjfcijewd';
            pro.isActive = true;
            proList.add(pro);
        }
        insert ProList;
        //list of pbes
        List<PricebookEntry>pbesList= new List<PricebookEntry>();
        for(Integer i=0;i<10;i++){
            PricebookEntry pbes = new PricebookEntry();
            pbes.IsActive=true;
            pbes.Product2Id =ProList[i].Id;
            pbes.Pricebook2Id =spb.Id;
            pbes.UnitPrice = 2;
            //  pbes.UseStandardPrice =false;
            pbesList.add(pbes);
        }
        insert pbesList;
        
        List<PricebookEntry>pbesCusList= new List<PricebookEntry>();
        for(Integer i=0;i<10;i++){
            PricebookEntry pbesCus = new PricebookEntry();
            pbesCus.IsActive=true;
            pbesCus.Product2Id=proList[i].Id;
            pbesCUS.Pricebook2Id = Algo.Id;
            pbesCus.UnitPrice=30;
            // pbesCus.UseStandardPrice=false;
            pbesCusList.add(pbesCus);
        }
        insert pbesCusList;
    } 
    
    public static void SystemAdminUser(){
        try{
            Profile ProfIleN  = [SELECT Id,Name  FROM Profile where name = 'Identity User'];
            User Admin = New User();
            Admin.LastName ='Twinkle';
            Admin.alias = 'Alias3';
            Admin.Email = 'yuhu@gmail.com';
            Admin.Username = 'NewUserji@acme.com';
            Admin.LocaleSidKey='en_US';
            Admin.TimeZoneSidKey='GMT';
            Admin.LanguageLocaleKey='en_US';
            Admin.EmailEncodingKey = 'UTF-8';
            Admin.ProfileId = ProfIleN.Id;
            if(Admin != null){
                insert Admin;
            }
        }catch(Exception er){
            system.debug('exception Ouccureed due to>>>'+er.getMessage() +'exception occured in line>>'+er.getLineNumber());
        }
    }
    */
    public static List<Case> createCaseMethod(integer n){
            account acc = [select id,name from account limit 1];
            Contact con = [select id,name from Contact limit 1];
            List<Case> CaseList = new List<Case>(); 
            for(integer i=0;i<n;i++){
                Case cas = new Case();
                cas.Status = 'New';
                cas.Origin = 'None';
                cas.AccountId =acc.Id;
                cas.ContactId =con.id;
                CaseList.add(cas);
            }
                return CaseList;
            
         
          /*
    }
      
    public static void copyJpgPdfMethod(){
        try{
            Account acc = [select id,name from account where name = 'NewOneoliviaoliviakingkingking' Limit 1];
            if(acc.id != null){
                List<Attachment> AtcList = [select id,ParentId,body,name from Attachment where ParentId =: acc.Id];
                List<Contact> ConList = [select id,name from Contact where AccountId =:acc.Id Limit 1];
                List<Attachment> atcNewList=new List<Attachment>();
                for(Contact con: ConList){
                    for(Attachment at :AtcList){
                        Attachment atc = new Attachment();
                        atc = at.clone();
                        atc.ParentId = Con.Id;
                        atcNewList.add(atc);
                    }
                    
                }
                if(atcNewList.size()>0){
                    insert atcNewList; 
                }
            }
        }catch(System.Exception er){
            System.debug('exception occur>>>'+er.getMessage()+'exception line no>>>'+er.getLineNumber());
        }  
    }
    
    public static void queryAllAccountClosedWon(){
        //Creating a Map of Id And OpportunityLineItem
        Map<Id,list<OpportunityLineItem>> MapIds =new   Map<Id,list<OpportunityLineItem>>();
        //creating a set of id
        Set<Id> AccIds = new  Set<Id>();
          Set<Id> OPPLineIds = new  Set<Id>();
        // iteratig a loop Andfilling values i Map
        for(Opportunity Opp : [SELECT Id, Name, AccountId, 
                               (SELECT Id, quantity FROM OpportunityLineItems where quantity>100)
                               FROM Opportunity where StageName = 'Closed Won']){
            MapIds.put(Opp.AccountId,Opp.OpportunityLineItems); 
            
        }
        for( Id  Ids :MapIds.KeySet() ){
            if(MapIds.get(Ids).size()>0){
                AccIds.add(Ids);
                OPPLineIds.add(Ids);
                
            }
        }system.debug('@opp2>>>'+ OPPLineIds);
        system.debug('22@@@@@@'+AccIds);
         List<OpportunityLineItem> OppLineListt = [select id,name,quantity from OpportunityLineItem where Id IN : OPPLineIds];
        List<Account> acc = [select id,name from Account where Id IN : AccIds];
        System.debug(acc);

*/
    }
    
    
    
    
    
    
}