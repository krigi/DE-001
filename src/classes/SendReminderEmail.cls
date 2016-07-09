global class SendReminderEmail implements Database.Batchable<sObject> {

    global String query;
	global String subject;
	global String body;

    global SendReminderEmail(String query, String subject, String body) {
        this.query = query;
        this.subject = subject;
        this.body = body;
    }

    
global Database.QueryLocator start(Database.BatchableContext bc) {
    return Database.getQueryLocator(query);
}

    global void execute(Database.BatchableContext bc, List<Speaker__c> scope) {

    }

    global void finish(Database.BatchableContext bc) {

    }

}