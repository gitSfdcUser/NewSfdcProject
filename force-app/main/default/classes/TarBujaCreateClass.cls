public class TarBujaCreateClass {
    public static void createRecord(){
        Dano__TarBuja__c dt = new Dano__TarBuja__c();
        dt.Name = 'Test Text 1';
        dt.Dano__Shape__c	= 'Oval';
        Insert dt;
       System.debug('dt:::::'+dt);

    }
}