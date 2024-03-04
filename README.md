
# GKPTriggerFramework

Salesforce Trigger Framework to provide the following capabilities

The Handler class provides a structured way to encapsulate the logic for handling  trigger events, while the Trigger delegates the execution of this logic to the handler class. 
This separation of concerns makes the trigger logic easier to manage and update, especially as the application grows in complexity.

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