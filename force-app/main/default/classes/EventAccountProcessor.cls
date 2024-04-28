public class EventAccountProcessor implements Database.Batchable<sObject>{
      public Database.QueryLocator start(Database.BatchableContext dbc) {
        return Database.getQueryLocator([SELECT Id,subject,StartDateTime,CreatedById,AccountId FROM Event where StartDateTime = Today]);
    }
      public void execute(Database.BatchableContext dbc,List<Event>EventList){
          Date duedate = system.today().addDays(1);
          List<Task> newTaskList = new List<Task>();
          for(Event evnts: EventList)
          {
              Task newTask = new Task();
               newTask.Subject = 'Create a follow up appointment if there is any';
               newTask.OwnerId = evnts.CreatedById;
               newTask.WhoId = evnts.AccountId;
               newTask.Type = 'Meeting';
               newTask.Priority = 'Normal';
          newTask.ActivityDate = dueDate;
          newTaskList.add(newTask);
     }
          //empty check
     if (!newTaskList.isEmpty()) {
          insert newTaskList;
     }
}
     
      public void finish (Database.BatchableContext dbc) {
        System.debug('done');
        
        
    }
}