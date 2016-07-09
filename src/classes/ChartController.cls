public class ChartController {

    public class getData{
        List<Account> SpendList = [
            SELECT id, Name, Type 
            FROM Account
            LIMIT 100];
    
        List<String> month = new List<String>();
        List<String> spend = new List<String>();

        /*    
        for(Account i : SpendList){
            month.add(1);
            spend.add(2);
            }
//        return month;
//        return spend;    
*/
	}


public class Spend {
    public Integer month {get;set;}
    public Integer spend {get;set;}
    Spend(Integer month, Integer spend) {
        this.month = month;
        this.spend = spend;

    }
}


}