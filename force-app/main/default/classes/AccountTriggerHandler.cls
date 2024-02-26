public with sharing class AccountTriggerHandler extends GKPTriggerHandler {
    
    public override void beforeInsert(List<SObject> newRecords) {
        List<Account> accounts = (List<Account>)newRecords;
        for(Account acc : accounts){
            acc.Name += ' - Processed';
        }
    }

    public override void afterInsert(List<SObject> newRecords){
        List<Account> accounts = (List<Account>)newRecords;
        //Implement logic
    }
}