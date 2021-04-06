public class FlightManager {

    public static List<Tourist__c> getTouristByAge(Set<String> newTourist) {
        List<Tourist__c> touristByAge = [
        	SELECT Age__c
           	FROM Tourist__c
            	WHERE Id IN :newTourist
        ];
        
        return touristByAge;
    }
    
    public static List<Trip__c> getTripByAge(Set<String> newTrip) {
        List<Trip__c> tripByAge = [
        	SELECT Minimum_Age__c
            	FROM Trip__c
            	WHERE Id IN :newTrip
        ];
            
        return tripByAge;
    }
}