@isTest
public class testClass {

	@testSetup static void createTestData() {
        Trigger_Run_Logic__c cs = Trigger_Run_Logic__c.getOrgDefaults();
        cs.RunClassObjectTrigger__c = true;

//		insert cs;
        
/*
        Trigger_Run_Logic__c cs = new Trigger_Run_Logic__c();
        cs.RunClassObjectTrigger__c = true;
        insert cs;
*/


    }
    
    static testmethod void testMethod1() {
		Trigger_Run_Logic__c cs = Trigger_Run_Logic__c.getInstance();
		System.assertEquals(true, cs.RunClassObjectTrigger__c);        
    }
}