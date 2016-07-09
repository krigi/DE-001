public  class MyController {
    public MyWrapper wrapper {get;set;}
    
    public MyController() {
        wrapper = new MyWrapper();
        addMyObject();
    }

    public void addMyObject() {
        wrapper.addObject(new MyObject__c());
    }

    public void refreshMyObject() {
        if(wrapper.MyObject.Field1__c != 'Yes') {
            wrapper.MyObject.Field2__c = null;
        }
	}
}