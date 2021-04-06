public class TouristService {
    
	public static void markDuplicates(List<Tourist__c> newTourists) {
        Set<String> newTouristNames = new Set<String>();
        Set<String> newTouristEmails = new Set<String>();
        
        for ( Tourist__c touristNew : newTourists) {
            newTouristNames.add(touristNew.Name);
            newTouristEmails.add(touristNew.Email__c);
        } 
		
        List<Tourist__c> oldTourists = new List<Tourist__c>(TouristManager.getTouristByEmail(newTouristNames, newTouristEmails));
        
        for (Tourist__c recordedTourist : oldTourists) {
            for (Tourist__c enteredTourist : newTourists) {
                if (recordedTourists.Name == enteredTourists.Name && recordedTourists.Email__c == enteredTourists.Email__c) {
                    enteredTourists.IsDuplicate__c = true;
                }
            }
        }
   }
}
