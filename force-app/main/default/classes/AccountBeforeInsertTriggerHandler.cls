public class AccountBeforeInsertTriggerHandler extends TriggerHandlerBase {
    public override void mainEntry(TriggerParameters trigParam) {
		for (Account acc : (List<Account>) trigParam.newList){
            for(Account acc : accounts){
                acc.Name += ' - Processed';
            }
        }
	}
}