public class TouristManager{
	
	public static List<Tourist__c> byName(String name) {
		if (String.isBlank(name)) {
			return new List<Tourist__c>();
		}
		
		String expression = '%' + name + '%';

		return [
			SELECT Name,
			Age__c
		        FROM Tourist__c
		        WHERE Name LIKE :expression];
	}

	public static List<Tourist__c> byAges(Set<Integer> ages) {
		if (ages.isEmpty() == true) {
			return new List<Tourist__c>();
		}

		return [
			SELECT Name,
			Age__c
		        FROM Tourist__c
		        WHERE Age__c IN :ages];
	}

	public static List<Flight__c> byStartYear(Integer year) {
		if (year == null) {
			return new List<Flight__c>();
		}

		return [
			SELECT Tourist_Name__r.Name, 
			Tourist_Name__r.Age__c
		        FROM Flight__c
		        WHERE CALENDAR_YEAR(Trip__r.Start_Date__c) = :year];
	}

	public static List<Flight__c> withListOfFlights() {

		return [
			SELECT Tourist_Name__r.Name, 
			Tourist_Name__r.Age__c,
			Trip__r.Name,
			Trip__r.Start_Date__c
		        FROM Flight__c];
	}

	public static List<Tourist__c> withoutFlightRegistration() {

		return [
			SELECT Name,
			Age__c
		        FROM Tourist__c
		        WHERE ID NOT IN (SELECT Tourist_Name__c
		                         FROM Flight__c)];
	}
}
