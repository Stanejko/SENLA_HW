public class FlightTriggerHandler {
	public static Boolean wasExecuted = true;
	
	public static void checkingAgeOfTourists(List<Flight__c> newFlights) {
		
		Set<String> idTourist = new Set<String>();
		Set<String> idTrip = new Set<String>();

		for (Flight__c newFlight : newFlights) {
			idTourist.add(newFlight.Tourist_Name__c);
			idTrip.add(newFlight.Trip__c);
		}

		Map<Id, Tourist__c> searchTourist = new Map<Id, Tourist__c>(FlightManager.getTouristByAge(idTourist));
		Map<Id, Trip__c> searchTrip = new Map<Id, Trip__c>(FlightManager.getTripByAge(idTrip));

		for (Flight__c flight : newFlights) {
			Tourist__c tourist = searchTourist.get(flight.Tourist_Name__c);
			Trip__c trip = searchTrip.get(flight.Trip__c);

			if (tourist.Age__c < trip.Minimum_Age__c) {
				flight.addError('You are not the right age!');
			}
			if (flightnew.Status__c == 'Past') {
                		flightnew.addError('The flight has already departed!');
            		}
		}
	}
}
