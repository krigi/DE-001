@isTest
public class TestVerifyDate {
    
    @isTest static void test_Within30Days() {
		//if date2 is within the next 30 days of date1, use date2.  Otherwise use the end of the month
		Date date1 = Date.newInstance(2015, 6, 20);
        Date date2 = Date.newInstance(2015, 7, 4);
        System.assertEquals(date2, verifyDate.CheckDates(date1, date2));
    }

    @isTest static void test_NotWithin30Days() {
		//if date2 is within the next 30 days of date1, use date2.  Otherwise use the end of the month
		Date date1 = Date.newInstance(2015, 1, 20);
        Date date2 = Date.newInstance(2015, 7, 4);
        System.assertEquals(Date.newInstance(date1.year(),date1.month(),Date.daysInMonth(date1.year(), date1.month())), verifyDate.CheckDates(date1, date2));
    }


}