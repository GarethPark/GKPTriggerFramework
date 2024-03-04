public with sharing class AccountAfterUpdateTriggerHandler extends TriggerHandlerBase {
    public override void mainEntry(TriggerParameters trigParam) {
        List<Account> accounts = (List<Account>) trigParam.newList;
        
        //Bulk SOQL
        Set<Id> accountIds = new Set<Id>();
        for (Account acc: accounts){
            accountIds.add(acc.Id);
        }

        List<Contact> relatedContacts = [SELECT Id, AccountId, FirstName, LastName FROM Contact WHERE AccountId IN :accountIds];
        for(Contact con : relatedContacts) {
            con.LastName += 'Updated'; // Hypothetical operation
        }
        // Bulk DML to update Contacts
        update relatedContacts;
	}
}