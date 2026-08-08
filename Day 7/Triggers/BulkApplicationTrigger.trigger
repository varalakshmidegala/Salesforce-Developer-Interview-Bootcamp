trigger BulkApplicationTrigger on Application__c (before insert) {

    if (Trigger.isBefore && Trigger.isInsert) {

        BulkApplicationProcessor.validateApplications(
            Trigger.new
        );
    }
}
