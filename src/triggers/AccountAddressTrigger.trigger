trigger AccountAddressTrigger on Account (before insert, before update) {

    for(Account tmp : Trigger.new) {
        if(tmp.Match_Billing_Address__c = TRUE) {
            tmp.ShippingPostalCode = tmp.BillingPostalCode;
        }
    }
}