trigger TouristTrigger on Tourist__c (before insert, after update) {

    if (Trigger.isInsert) {
        TouristService.markDuplicates(Trigger.New);
    }
    if (Trigger.isAfter) {
        TouristService.flightStatusChange(Trigger.New);
    }
}
