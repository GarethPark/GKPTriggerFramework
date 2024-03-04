public interface ITriggerHandler {

    void mainEntry(TriggerParameters tp);
	void inProgressEntry(TriggerParameters tp);
    void updateObjects();
}