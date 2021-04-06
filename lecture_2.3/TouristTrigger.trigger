trigger TouristTrigger on Tourist__c (before insert) {

    if (Trigger.isInsert) {
        TouristService.markDuplicates(Trigger.New);
    }
}
