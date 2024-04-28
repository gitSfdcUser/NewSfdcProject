public class CustomErrorForFlow {
  @InvocableMethod(label='Add Error to Opportunity' description='Adds an error message to the Opportunity' category='Opportunity')
  public static void addErrorToOpportunity(List<Opportunity> opportunities) {
    if (!opportunities.isEmpty()) {
      Opportunity opp = opportunities[0];
      opp.addError('Operation Cancelled: Please provide a rejection reason!');
    }
  }
}