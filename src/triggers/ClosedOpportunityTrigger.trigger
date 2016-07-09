trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    List<Task> tList = new List<Task>();

    for(Opportunity tmp : [SELECT Id, Name, StageName FROM Opportunity WHERE Id IN : Trigger.new AND StageName = 'Closed Won']) {
		Task t = new Task(Subject = 'Follow Up Test Task', WhatId = tmp.Id);
        tList.add(t);
        SYstem.debug(t);
    }

    if(tList.size() > 0) {
        try {
            System.debug('the insert!');
            insert tList;
        } catch (Exception e) {
            System.debug('Exception e: ' + e);
        }
    }    

}