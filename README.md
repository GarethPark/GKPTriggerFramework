
# GKPTriggerFramework

Salesforce Trigger Framework to provide the following capabilities

TriggerFactory creates an instance of the appropriate dispatcher based the object type of the trigger. This is done via creating a new instance based on object type. ITriggerDispatcher interface defines the contract of a dispatcher

TriggerFactory execute method routes to the appropriate method on the dispatcher

TriggerDispatcherBase implements ITriggerDispatcher allow us to only implement the methods we require. 

If this is the first call in the context then this method will create a new instance of the appropriate handler and execute the mainEntry method. 

TriggerParameter - enum of trigger events, lists for trigger parameters (old and new list/maps), object. Constructor to populate.

ITriggerHandler - defines the contract to be implemented by trigger handlers

TriggerHandlerBase - implements ITriggerHandler. Trigger handlers need to implement only the method that they have to

AccountTriggerDispatcher - (example) - extends TriggerDispatcherBase - provides the dispatching functionality for the trigger actions 
on the Account object. Will execute AccountBeforeInsertTriggerHandler

AccountBeforeInsertTriggerHandler - Dummy logic to execute before inserting an account


To run tests;

sfdx force:apex:test:run --testlevel RunLocalTests --codecoverage --resultformat human --targetusername gkps

with coverage;

sfdx force:apex:test:run --testlevel RunLocalTests -r human -c -u gkps -w 10