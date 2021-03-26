trigger TouristTrigger on Tourist__c (before insert) {
    List<Tourist__c> tourist = [SELECT Name,
                                Email__c
                                FROM Tourist__c];
    
    for (Tourist__c touristOld : tourist) {
        for (Tourist__c touristInsert : Trigger.New) {
            if (touristOld.Name == touristInsert.Name && touristOld.Email__c == touristInsert.Email__c) {
                touristInsert.IsDuplicate__c = true;
            }
        }
    }
}
