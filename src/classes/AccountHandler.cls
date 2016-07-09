public class AccountHandler {

    public static Account insertNewAccount (String n) {
        try {
			Account a = new Account(name=n);
            insert a;
            System.debug('Success, account has been inserted: ' + a);
			return a;
        } catch (Exception e) {
        	System.debug('Exception thrown: ' + e);
            return null;
        }
    }    
}