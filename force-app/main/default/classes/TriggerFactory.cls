public with sharing class TriggerFactory {

    public static void createTriggerDispatcher(Schema.SObjectType soType){

        ITriggerDispatcher dispatcher = getTriggerDispatcher(soType);
        if (dispatcher == null){
            throw new TriggerException('No Trigger dispatcher found for object ' + soType);
        }
        execute(dispatcher);
    }

    private static void execute(ITriggerDispatcher dispatcher){
    	TriggerParameters tp = new TriggerParameters(Trigger.old, Trigger.new, Trigger.oldMap, Trigger.newMap,
									Trigger.isBefore, Trigger.isAfter, Trigger.isDelete, 
									Trigger.isInsert, Trigger.isUpdate, Trigger.isUnDelete, Trigger.isExecuting);
        
        if (Trigger.isBefore) {
            dispatcher.bulkBefore();
            if (Trigger.isDelete)
                dispatcher.beforeDelete(tp);
            else if (Trigger.isInsert)
                dispatcher.beforeInsert(tp);
            else if (Trigger.isUpdate)
                dispatcher.beforeUpdate(tp);         
        }
        else {
            dispatcher.bulkAfter();
            if (Trigger.isDelete)
                dispatcher.afterDelete(tp);
            else if (Trigger.isInsert)
                dispatcher.afterInsert(tp);
            else if (Trigger.isUpdate)
                dispatcher.afterUpdate(tp);
        }
        dispatcher.andFinally();
    } 

    private static ITriggerDispatcher getTriggerDispatcher(Schema.SObjectType sObjectType){

        String typeName = sObjectType.getDescribe().getName();
        String dispatchTypeName = null;

        if (typeName.toLowerCase().endsWith('__c')){
            Integer index = typeName.toLowerCase().indexOf('__c');
            dispatchTypeName = typeName.substring(0, index) + 'TriggerDispatcher';
        }
        else {
            dispatchTypeName = typeName + 'TriggerDispatcher';
        }

        Type objectType = Type.forName(dispatchTypeName);
        ITriggerDispatcher dispatcher = (objectType == null) ? null  : (ITriggerDispatcher)objectType.newInstance();
        return dispatcher;
    }
}