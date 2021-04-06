trigger FlightTrigger on Flight__c(before insert ) {
	if (FlightTriggerHandler.wasExecuted) {
		FlightTriggerHandler.wasExecuted = false;
		
		switch on Trigger.operationType {
			when BEFORE_INSERT {
				FlightTriggerHandler.checkingAgeOfTourists(Trigger.New);
			}
		}
	}
}
