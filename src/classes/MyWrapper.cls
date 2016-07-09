public class MyWrapper {

    public MyObject__c myObject {get;set;}

    public void addObject(MyObject__c newObject) {
        myObject = newObject;
    }
}