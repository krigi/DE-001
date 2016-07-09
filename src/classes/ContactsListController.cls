public class ContactsListController {
    private String sortOrder = 'LastName';
	private String sortOrder2 = 'ASC';

    public List<Contact> getContacts() {
        
        List<Contact> results = Database.query(
            'SELECT Id, FirstName, LastName, Title, Email ' +
            'FROM Contact ' +
            'ORDER BY ' + sortOrder + ' ' + sortOrder2 + ' ' +
            'LIMIT 10'
        );
		sortOrder2 = (sortOrder2=='ASC'?'DESC':'ASC');
        return results;
    }

    public void sortByLastName() {
        this.sortOrder = 'LastName';
		this.sortOrder2 = (sortOrder2=='ASC'?'DESC':'ASC');
    }
        
    public void sortByFirstName() {
        this.sortOrder = 'FirstName';
		this.sortOrder2 = (sortOrder2=='ASC'?'DESC':'ASC');
    }

}