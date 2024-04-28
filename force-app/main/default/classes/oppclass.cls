global class oppclass {
    @InvocableMethod
  //@InvocableMethod(label='Get Account Names' description='Returns the list of account names corresponding to the specified account IDs.' category='Account')
   /* public static List<Opportunity> oppmethod(){
        List<Opportunity>list1=new List<Opportunity>();
        
        for(Integer i=0;i<2;i++)
        {
            Opportunity opp = new Opportunity();
            opp.CloseDate=Date.Today();
            opp.StageName='Prospecting';
            opp.Name='NewCreation'+i;
            list1.add(opp);
        }
        //insert list1;
        System.debug(list1);
        
        return list1;
    }
*/
    
         global static void DebugWelcome(){
             List<Opportunity>list1=new List<Opportunity>();
             Date myDate = Date.newInstance(1960, 2, 17);

             for(Integer i=0;i<2;i++){          
        System.debug('Welcome Your Code Working>>>>>>');
        Opportunity opp = new Opportunity();
            opp.CloseDate=myDate;
            opp.StageName='Prospecting';
            opp.Name='NewCreationUYN'+i;
             list1.add(opp); 
             }
        insert list1;
        System.debug('OppppppppppList>>>>>>>'+list1);
    
}
}