public class FlightDeleteBatch implements Database.Batchable<sObject>, Database.Stateful {
    
    private String query =   'SELECT Id, Tourist_Name__r.Name, ' +
            		     'Tourist_Name__r.Id ' +
            		     'FROM Flight__c ' +
             		     'WHERE Status_of_flight__c = \'Declined\'';
    
    Map<Id, Integer>  tourists = new Map<Id, Integer>();
    
    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(query);
    }
    
    public void execute(Database.BatchableContext bc, List<Flight__c> scope) {
        Map<Id, Flight__c>  flightById = new Map<Id, Flight__c>(scope);
        Database.DeleteResult[] drList = Database.delete(scope, false);
        
        for (Database.DeleteResult dr : drList) {
            Flight__c flight = flightById.get(dr.getId());

            if (dr.isSuccess()) {
                Integer count = tourists.get(flight.Tourist_Name__r.id);
                
                if (count == null) {
                    tourists.put(flight.Tourist_Name__r.id, 0);
                } 
                tourists.put(flight.Tourist_Name__r.id, count+1);
            }
            
        }
    }
    
    public void finish(Database.BatchableContext bc) {
        
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        
        AsyncApexJob job = [
            		     SELECT Id,
           	 	     Status,
            		     NumberOfErrors,
            		     JobItemsProcessed,
                             TotalJobItems,
                             CreatedBy.Email
            		     FROM AsyncApexJob
            		     WHERE Id = :bc.getJobId()
        ];
        
        Set<id> touristId = tourists.keySet();
        List<Tourist__c> touristsInfo = [ 
        				  SELECT id,
            				  Name,
            				  Age__c
        				  FROM Tourist__c
        				  WHERE id IN :touristId
        ];
        
        String[] email = new String[]{job.CreatedBy.Email};
        mail.setToAddresses(email);
        mail.setReplyTo(Constants.SEND_EMAIL);
        mail.setSubject('Batch Processing '+job.Status);
        mail.setPlainTextBody('Info by tourists:' + touristsInfo +tourists );
        Messaging.sendEmail(new Messaging.Singleemailmessage[] {mail});
    }
}