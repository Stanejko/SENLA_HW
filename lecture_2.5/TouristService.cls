public class TouristService {
	public static Boolean wasExecuted = false;
	
	public static void markDuplicates(List<Tourist__c> newTourists) {
        Set<Id> newTouristsIds = new Set<Id>();
        
        for ( Tourist__c touristNew : newTourists) {
            newTouristsId.add(touristNew.Id);
        } 
		
        TouristService.markDuplicatesAsync(newTouristsId);       
   }
	
 	public static void flightStatusChange(List<Tourist__c> tourists) {
        Set<String> inactiveTourists = new Set<String>();
        
        for (Tourist__c tourist : tourists) { 
            if (tourist.Active__c == false) {
                inactiveTourist.add(tourist.id);
            }
        }
        
        List<Flight__c> flights = new List<Flight__c>(FlightManager.getFlightsByInactiveTourists(inactiveTourist));
        
        for (Flight__c flight : flights) {
            flight.Status_of_flight__c = 'Declined';
        }
        
        update flights;
    }	
    
    @future
    public static void markDuplicatesAsync(Set<Id> newTouristsId) {
        Set<String> newTouristNames = new Set<String>();
        Set<String> newTouristEmails = new Set<String>();
        
        List<Tourist__c> newTourists = new List<Tourist__c>(TouristManager.getById(newTouristsId));
        
        for ( Tourist__c touristNew : newTourists) {
            newTouristNames.add(touristNew.Name);
            newTouristEmails.add(touristNew.Email__c);
        } 
		
        List<Tourist__c> oldTourists = new List<Tourist__c>(TouristManager.getTouristByEmail(newTouristNames, newTouristEmails));
        
        for (Tourist__c recordedTourists : oldTourists) {
            for (Tourist__c enteredTourists : newTourists) {
                if (recordedTourists.Id != enteredTourists.Id && recordedTourists.Name == enteredTourists.Name && recordedTourists.Email__c == enteredTourists.Email__c) {
                    enteredTourists.IsDuplicate__c = true;
                }
            }
        }
        
        update newTourists;
   }
}
