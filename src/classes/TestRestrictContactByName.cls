@isTest
public class TestRestrictContactByName {

    @isTest static void testInsert() {
        //create a Contact
		Contact c = new Contact (firstName = 'first', lastName = 'INVALIDNAME');

		//perform the test
		Test.startTest();
        Database.SaveResult result = Database.insert(c, false);
		Test.stopTest();
        
        //assert behavior
		System.assertEquals('The Last Name "INVALIDNAME" is not allowed for DML', result.getErrors()[0].getMessage());
    }

    @isTest static void testUpdate() {
        //create a Contact
		Contact c = new Contact (firstName = 'first', lastName = 'VALIDNAME');

		//perform the test
		Test.startTest();
        Database.SaveResult insertResult = Database.insert(c, false);
        
        //assert behavior (no errors)
		System.assertEquals(0,insertResult.getErrors().size());

		//update the thing
		c.lastName = 'INVALIDNAME';
        Database.SaveResult updateResult = Database.update(c, false);
		Test.stopTest();
        
        //assert behavior
		System.assertEquals('The Last Name "INVALIDNAME" is not allowed for DML', updateResult.getErrors()[0].getMessage());

    }

}