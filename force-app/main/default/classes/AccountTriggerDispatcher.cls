public class AccountTriggerDispatcher extends TriggerDispatcherBase {
    private static Boolean isBeforeInsertProcessing = false;
    
    public virtual override void beforeInsert(TriggerParameters trigParam){
        if(!isBeforeInsertProcessing){
            isBeforeInsertProcessing = true;
            execute(new AccountBeforeInsertTriggerHandler(), trigParam, TriggerParameters.TriggerEvent.beforeInsert);
            isBeforeInsertProcessing = false;
        }
        else execute(null, trigParam, TriggerParameters.TriggerEvent.beforeInsert);
    }
}