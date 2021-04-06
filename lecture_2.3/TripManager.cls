public class TripManager {
    
    public static List<Trip__c> getTripByAges(Set<String> newTrip) {
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