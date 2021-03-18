trigger TouristTrigger on Tourist__c (before insert) {
    List<Tourist__c> tourist = [SELECT Name,
                                Email__c
                                FROM Tourist__c];
    
    for (Tourist__c touristFirst : tourist)
    {
        for (Tourist__c touristInsert : Trigger.New)
        {
            if (touristFirst.Name == touristInsert.Name && touristFirst.Email__c == touristInsert.Email__c){
                touristInsert.IsDuplicate__c = true;
                touristFirst.IsDuplicate__c = true;
            }
        }
    }
   update tourist;
}