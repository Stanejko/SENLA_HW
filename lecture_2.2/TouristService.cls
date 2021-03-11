public class TouristService {
    
    public static void markDuplicates(List<Tourist__c> newTourists){
        
        for(Integer i = 0; i < newTourists.size() - 1; i++){
            Tourist__c tourist_1 = newTourists.get(i);
            
            for(Integer j = 0; j < newTourists.size(); j++){
                if (i == j)
                {
                    continue;
                }
                
                Tourist__c tourist_2 = newTourists.get(j);  
                
                if (tourist_1.Name.equals(tourist_2.Name) 
                    && tourist_1.Email__c.equals(tourist_2.Email__c))
                {
                    tourist_1.IsDuplicate__c = true;
                    tourist_2.IsDuplicate__c = true;
                    update  tourist_1;
                    update  tourist_2;
                }
            }
        }
    }
}