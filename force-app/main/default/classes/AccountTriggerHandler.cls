public with sharing class AccountTriggerHandler extends GKPTriggerHandler {
    
    public override void beforeInsert(List<SObject> newRecords) {
        List<Account> accounts = (List<Account>)newRecords;
        for(Account acc : accounts){
            acc.Name += ' - Processed';
        }
    }

    public override void afterInsert(List<SObject> newRecords){
        List<Account> accounts = (List<Account>)newRecords;
        
        //Bulk SOQL
        Set<Id> accountIds = new Set<Id>();
        for (Account acc: accounts){
            accountIds.add(add.Id);
        }

        List<Contact> relatedContacts = [SELECT Id, AccountId FROM Contact WHERE AccountId IN :accountIds];
        for(Contact con : relatedContacts) {
            con.LastName =+ 'Updated'; // Hypothetical operation
        }
        // Bulk DML to update Contacts
        update relatedContacts;
    }
}