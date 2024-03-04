public class AccountTriggerDispatcher extends TriggerDispatcherBase {
    private static Boolean isBeforeInsertProcessing = false;
    private static Boolean isAfterInsertProcessing = false;
    private static Boolean isAfterUpdateProcessing = false;
    
    public virtual override void beforeInsert(TriggerParameters trigParam){
        if(!isBeforeInsertProcessing){
            isBeforeInsertProcessing = true;
            execute(new AccountBeforeInsertTriggerHandler(), trigParam, TriggerParameters.TriggerEvent.beforeInsert);
            isBeforeInsertProcessing = false;
        }
        else execute(null, trigParam, TriggerParameters.TriggerEvent.beforeInsert);
    }

    public virtual override void afterInsert(TriggerParameters trigParam){
        System.debug('afterInsert dispatcher');
        if(!isAfterInsertProcessing){
            isAfterInsertProcessing = true;
            execute(new AccountAfterInsertTriggerHandler(), trigParam, TriggerParameters.TriggerEvent.afterInsert);
            isAfterInsertProcessing = false;
        }
        else execute  (null, trigParam, TriggerParameters.TriggerEvent.afterInsert);
    }

    public virtual override void afterUpdate(TriggerParameters trigParam){
        System.debug('afterUpdate dispatcher');
        if(!isAfterUpdateProcessing){
            isAfterUpdateProcessing = true;
            execute(new AccountAfterUpdateTriggerHandler(), trigParam, TriggerParameters.TriggerEvent.afterInsert);
            isAfterUpdateProcessing = false;
        }
        else execute  (null, trigParam, TriggerParameters.TriggerEvent.afterInsert);
    }
}