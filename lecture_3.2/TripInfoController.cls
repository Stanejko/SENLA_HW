public class TripInfoController {
	public Trip__c trip;
    
    public List<Tourist__c> notRelatedTourists {get; set;}
    
    public TripInfoController(ApexPages.StandardController controller) {
       this.trip = (Trip__c)controller.getRecord();
        //this.notRelatedTourists = TouristManager.getNotRelatedTourists(trip.Id);
    }
}