trigger AccountTrigger on SOBJECT (before insert, after insert, before update, after update, before delete, after delete, after undelete) {
    AccountTriggerHandler handler = new AccountTriggerHandler();

    if (Trigger.isBefore){
        if (Trigger.isInsert){
            handler.beforeInsert(Trigger.new);
        }
    }else if (Trigger.isAfter) {
        if (Trigger.isInsert){
            handler.afterInsert(Trigger.new);
        }
    }
}