public class RandomContactFactory {
    
    public static List<Contact> generateRandomContacts (Integer qty, String lName) {
        if((qty == null || qty == 0) || (lName == null || lName == '')) {
            return null;
        } else {
			List<Contact> cList = new List<Contact>();
            for(Integer i=0; i<qty; i++) {
                Contact tmp = new Contact(firstName = 'first ' + i, lastName = lName);
                cList.add(tmp);
            }
            return cList;
        }
    }
}