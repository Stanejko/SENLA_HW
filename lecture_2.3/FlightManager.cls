public class FlightManager {

    public static List<Tourist__c> getTouristByAge(Set<String> newTourist) {
        if (newTourist == null || newTourist.isEmpty()) {
            return new List<Tourist__c>();
        } 
        
        List<Tourist__c> touristByAge = [
        	SELECT Age__c
           	FROM Tourist__c
            	WHERE Id IN :newTourist
        ];
        
        return touristByAge;
    }
    
    public static List<Trip__c> getTripByAge(Set<String> newTrip) {
        if (newTrip == null || newTrip.isEmpty()) {
            return new List<Trip__c>();
        } 
        
        List<Trip__c> tripByAge = [
        	SELECT Minimum_Age__c
            	FROM Trip__c
            	WHERE Id IN :newTrip
        ];
            
        return tripByAge;
    }
}
