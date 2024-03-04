public class AccountBeforeInsertTriggerHandler extends TriggerHandlerBase {
    public override void mainEntry(TriggerParameters trigParam) {
		for (Account acc : (List<Account>) trigParam.newList){
            acc.Name += ' - Processed';
        }
	}
}