public class ContactAndLeadSearch {

    public static List<List<SObject>> searchContactsAndLeads (String searchParam) {
        List<List<sObject>> searchList;
        if(searchParam == '' || searchParam == null) {
            return searchList;
        }
        else {
            searchList = new List<List<sObject>>();
            searchList = [FIND :searchParam IN NAME FIELDS RETURNING Contact(FirstName,LastName), Lead(FirstName,LastName)];
            return searchList;
        }
    }
}