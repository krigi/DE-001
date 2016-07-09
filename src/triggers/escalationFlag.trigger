trigger escalationFlag on Case (before insert, before update) {
    for(Case c : Trigger.new) {
        if(c.IsEscalated == TRUE) {
            c.beenEscalated__c = TRUE;
        }
    }    

}