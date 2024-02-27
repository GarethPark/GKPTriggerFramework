public with sharing class TriggerFactory {

    public static void createTriggerDispatcher(Schema.SObjectType soType){

        TriggerDispatcher dispatcher = getTriggerDispatcher(soType);
        if (dispatcher == null){
            throw new Exception('No Trigger dispatcher found for object ' + soType);
        }
        execute(dispatcher);
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
        ITriggerDispatcher dispatcher = (objType == null) ? null  : (ITriggerDispatcher).objType.newInstance();
        return dispatcher;
    }
}