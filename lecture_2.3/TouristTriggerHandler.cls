public class TouristTriggerHandler {

  public static void markDuplicates(List<Tourist__c> newTourists) {
      if (newTourists == null || newTourists.isEmpty()) return ;
          
  List<Tourist__c> tourists = [
                                SELECT Name,
                                Email__c
                                FROM Tourist__c];
  
  for (Tourist__c touristFirst : tourists) {
      for (Tourist__c touristInsert : newTourists) {
          if (touristFirst.Name == touristInsert.Name && touristFirst.Email__c == touristInsert.Email__c) {
              touristInsert.IsDuplicate__c = true;
            }
        }
    }
  }
}