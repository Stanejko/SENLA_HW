public class FlightDeleteBatch implements Database.Batchable<sObject>, Database.Stateful {
    
    private String query = 'SELECT Id, Tourist_Name__r.Name, ' +
            		       'Tourist_Name__r.Id ' +
            		       'FROM Flight__c ' +
             		       'WHERE Status_of_flight__c = \'Declined\'';
    
    Map<Id, Integer>  deleteFlightsByTourists = new Map<Id, Integer>();
    
    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(query);
    }
    
    public void execute(Database.BatchableContext bc, List<Flight__c> scope) {
        Map<Id, Flight__c>  flightById = new Map<Id, Flight__c>(scope);
        Database.DeleteResult[] drList = Database.delete(scope, false);
        
        for (Database.DeleteResult dr : drList) {
            Flight__c flight = flightById.get(dr.getId());

            if (dr.isSuccess()) {
                Integer count = deleteFlightsByTourists.get(flight.Tourist_Name__r.id);
                
                if (count == null) {
                    deleteFlightsByTourists.put(flight.Tourist_Name__r.id, 0);
                } 
                deleteFlightsByTourists.put(flight.Tourist_Name__r.id, count+1);
            }
            
        }
    }
    
    public void finish(Database.BatchableContext bc) {
        
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();  
        Set<id> touristId = deleteFlightsByTourists.keySet();
        List<Tourist__c> touristsInfo = TouristManager.getById(touristId);
        MyCustomType__mdt email = [
            						SELECT Email__c
            						FROM MyCustomType__mdt
         ];
        
        String[] emails = new String[]{email.Email__c};
        mail.setToAddresses(emails);
        mail.setReplyTo(Constants.SEND_EMAIL);
        mail.setPlainTextBody('Info by tourists:' + touristsInfo +tourists );
        Messaging.sendEmail(new Messaging.Singleemailmessage[] {mail});
    }
}