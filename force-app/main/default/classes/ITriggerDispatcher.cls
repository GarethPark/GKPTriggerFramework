public interface ITriggerDispatcher {
	
	void beforeInsert(TriggerParameters tp);
	
	void beforeUpdate(TriggerParameters tp);
	
	void beforeDelete(TriggerParameters tp);
	
	void afterInsert(TriggerParameters tp);
	
	void afterUpdate(TriggerParameters tp);

	void afterDelete(TriggerParameters tp);
	
	void afterUnDelete(TriggerParameters tp);

    void bulkBefore();
	
	void bulkAfter();
	
	void andFinally();
}