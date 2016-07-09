public class ContactSearch {

    public static List<Contact> searchForContacts (String arg_lastName, String arg_mailingPostalCode) {
        List<Contact> cList;
        
        if((arg_lastName == '' || arg_lastName == null) || (arg_mailingPostalCode == '' || arg_mailingPostalCode == null)) {
            return cList;
    	}
        else {
			cList = new List<Contact>();
            System.debug(arg_lastName + ': ' + arg_MailingPostalCode);
            for(Contact tmp : [SELECT Id, Name, LastName, mailingPostalCode FROM Contact WHERE LastName =: arg_lastName AND mailingPostalCode =: arg_mailingPostalCode ]) {
                cList.add(tmp);
            }            
            return cList;
        }
    }
}