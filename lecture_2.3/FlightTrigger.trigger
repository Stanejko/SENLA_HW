trigger FlightTrigger on Flight__c(before insert ){
	if (Trigger.isInsert){
		FlightTriggerHandler.checkingAgeOfTourists(Trigger.New);
	}
}