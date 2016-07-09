public class StringArrayTest {

    public static List<String> generateStringArray(Integer param) {
    	List<String> listOfIntegersToReturn;		
        if(param <= 0) return listOfIntegersToReturn;
        else {
			listOfIntegersToReturn = new List<String>();
            for(Integer n = 0; n<param; n++) {
                String tmp = 'Test ' + n;
                listOfIntegersToReturn.add(tmp);
            }
			return listOfIntegersToReturn;
        }
    }

}