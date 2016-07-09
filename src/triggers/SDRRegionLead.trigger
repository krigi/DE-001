trigger SDRRegionLead on Lead(after insert, after update) {

//pleasant, amazingly functional after trigger means I need to update via a List
//I also need to read up on trigger context variables, perhaps at
// https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_triggers_context_variables.htm
List<Lead> leadUpdate = new List<Lead>();

Map < Id, SDR_Region__c > regionmap =  new Map < Id, SDR_Region__c > ([SELECT Id, Corporate_Sales_Region__c, Field_Sales_Region__c, Number_of_Employees_Lower_Fence__c, Number_of_Employees_Upper_Fence__c, SDR_Region_Name__c, States__c FROM SDR_Region__c ]);

for(Lead newLead : [SELECT Id, NumberOfEmployees, Geography__c, SDR_Region__c FROM Lead WHERE Id IN: trigger.newMap.keySet()]) {
    
    If(Trigger.isUpdate) {
        Lead oldLead = Trigger.oldmap.get(NewLead.id);

        // Do new vs old check so it doesnt always fire
        //Broken into each category so it will only run based on set rules of what MIGHT change for each lookup
        //Geography__c = Field Sales Region

        If(oldLead.NumberOfEmployees !=  newLead.NumberOfEmployees || oldLead.Geography__c !=  newLead.Geography__c) {
			System.debug('Hit 1! ' + regionmap);
            for (ID idKey : regionmap.keyset()) {
				System.debug('Hit 2! ' + idKey);

                SDR_Region__c SDRR = regionmap.get(idKey);
				System.debug('SDRR: ' + SDRR);

                if (newLead.Geography__c != NULL) {
					System.debug('in your BASE!');

                    if (newLead.Geography__c == SDRR.Field_Sales_Region__c && (newLead.NumberOfEmployees >= SDRR.Number_of_Employees_Lower_Fence__c ||  newLead.NumberOfEmployees == SDRR.Number_of_Employees_Lower_Fence__c) &&  newLead.NumberOfEmployees <= SDRR.Number_of_Employees_Upper_Fence__c) {
						System.debug('omg WAY in your BASE!!');
                        newLead.SDR_Region__c = SDRR.Id;
                        leadUpdate.add(newLead);
                    }
                }
            }
        }
    }
 }

    try {
		update leadUpdate;
    } catch (Exception e) {
        System.debug('OOPS its on FIRE: ' + e);
    }
}