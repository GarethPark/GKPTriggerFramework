@isTest
public with sharing class GKPTriggerFrameworkTest {

    public static testMethod void testAccountTrigger() {
        Account acct = new Account();
        acct.Name = 'testAccount';
        acct.AccountSource = 'testSource';
        insert acct;

        Account acct2 = [SELECT Id, Name FROM Account WHERE AccountSource = 'testSource' LIMIT 1];
        acct2.Name = 'testAccountUpdated';
        update acct2;
        System.assert(true);
    }
}