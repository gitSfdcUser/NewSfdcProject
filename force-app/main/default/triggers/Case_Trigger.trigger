trigger Case_Trigger on Case (before insert,before update,before delete,after insert) {
    new Case_Trigger_Handler().run();
}