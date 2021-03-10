public class TouristManager 
{
	/*public List<Tourist__c> getTouristByName(String name)
	{
            
		if(String.isBlank(name))
        {
        	return new List<Tourist__c>();
        }
            
        return [SELECT Name,
                  Birthdate__c
                  FROM Tourist__c
                  WHERE Name LIKE :name];
    }*/
      
    public List<Tourist__c> getTouristByName(String name)
	{
        String expression = '%'+ name + '%';
        
		if(String.isBlank(name))
        {
        	return new List<Tourist__c>();
        }
        
        return [
            	SELECT Name,
                  Age__c
                  FROM Tourist__c
                  WHERE Name LIKE :expression];
    } 

     public List<Tourist__c> getTouristByAge(Integer age)
     {
         if (age == null )
        {
        	return new List<Tourist__c>();
        }
        
        return [
            	SELECT Name,
                  Age__c
                  FROM Tourist__c
                  WHERE Age__c =:age];
     }
    
    public List<Flight__c> getTouristByStartYear(Integer year)
    {
         if (year == null )
        {
        	return new List<Flight__c>();
        }
        
        return [
            		SELECT Tourist_Name__r.Name,
                  		Tourist_Name__r.Age__c
                 	    FROM Flight__c
                  		WHERE CALENDAR_YEAR(Trip__r.Start_Date__c) =: year];
    }
    
     public List<Tourist__c> getTouristByRegistration()
    {
  
        return [
            		SELECT Name, Age__c
                  	  FROM Tourist__c
                  	  WHERE ID NOT IN (SELECT Tourist_Name__c FROM Flight__c)];
    }
  }