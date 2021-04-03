trigger TouristTrigger on Tourist__c (before insert) {

    if (Trigger.isInsert) {
        TouristTriggerHandler.markDuplicates(Trigger.New);
    }
}
