<apex:page standardController="Trip__c" extensions="TripInfoController" lightningStylesheets="true">
    <apex:pageBlock>
        <apex:pageBlockSection columns="1" title="Trip Info">
            <apex:outputField value="{! Trip__c.Id }"/>
            <apex:outputField value="{! Trip__c.Name }"/>
            <apex:outputField value="{! Trip__c.Minimum_Age__c }"/>
            <apex:outputField value="{! Trip__c.Start_Date__c }"/>
            <apex:outputField value="{! Trip__c.Point_of_arrival__c }"/>
        </apex:pageBlockSection>
        
        <apex:pageBlockSection>
            <apex:form style="text-align: center" >
                <apex:commandButton value = "Edit" action = "{!Edit}"/>
            </apex:form>
        </apex:pageBlockSection>
        
        <apex:pageBlockSection title="Related flights">
        	<apex:relatedList list="Flights__r"/>
        </apex:pageBlockSection>
        
        <apex:pageBlockSection title="Registered tourists">
        	<apex:pageBlockTable value = "{!Trip__c.Flights__r}" var = "flight">
                <apex:column value = "{!flight.Tourist_Name__r.Id}"/>
                <apex:column value = "{!flight.Tourist_Name__r.Name}"/>
                <apex:column value = "{!flight.Tourist_Name__r.Birthdate__c}"/>
                <apex:column value = "{!flight.Tourist_Name__r.Age__c}"/>
                <apex:column value = "{!flight.Tourist_Name__r.Email__c}"/>
            </apex:pageBlockTable>
        </apex:pageBlockSection>
    </apex:pageBlock>
</apex:page>