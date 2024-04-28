public class UpdateOppStage {
    public static void updateStage(List<Opportunity> oppList) {
        List<OpportunityLineItem> oliList =new List<OpportunityLineItem>();
        if(oppList.size() > 0) {
            oliList = [select Id,name,OpportunityId from OpportunityLineItem where OpportunityId IN: oppList];
            system.debug('oliList::'+oliList);
        }
        if(oliList.size() < 1 && oppList[0].StageName == 'Closed Won'){
            oppList[0].StageName.addError('This field cannot be CLosedWon without any Opportunity Line Item');
        }
    }
}