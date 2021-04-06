trigger TouristTrigger on Tourist__c (before insert, after update) {

    if (TouristService.wasExecuted) {
        TouristService.wasExecuted = false;
        
        switch on Trigger.operationType {
            when BEFORE_INSERT {
               TouristService.markDuplicates(Trigger.New);
            }
            when AFTER_UPDATE {
               TouristService.flightStatusChange(Trigger.New);
            }       
        }
    }
}
