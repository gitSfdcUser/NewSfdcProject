trigger ProductTrigger on Product2 (after insert,after update) {
    if (Trigger.isInsert || Trigger.isUpdate) {
        if (Trigger.isAfter) {
           UpdatePriceook.UpdateStandardPrice(Trigger.New);
           
        }
    }
}