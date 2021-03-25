public class TouristService {

	public static void markDuplicates(List<Tourist__c> newTourists) {

		for (Integer i = 0; i < newTourists.size()-1; i++) {
			Tourist__c newTourist = newTourists.get(i);

			for (Integer j = 0; j < newTourists.size(); j++) {
				if (i == j) {
					Tourist__c oldTourist = newTourists.get(j);

					if (newTourist.Name == oldTourist.Name && newTourist.Email__c == oldTourist.Email__c) {
						newTourist.IsDuplicate__c = true;
					}
				}
			}
		}
	}
}
