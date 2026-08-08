trigger ApplicationTrigger on Application__c (before insert, after update) {

    if (Trigger.isBefore && Trigger.isInsert) {

        ApplicationTriggerHandler.beforeInsert(Trigger.new);

        // Business validation is handled by the Service
        ApplicationService.validateApplications(Trigger.new);

        // Duplicate check remains in the Handler
        ApplicationTriggerHandler.preventDuplicateApplication(Trigger.new);
    }

    if (Trigger.isAfter && Trigger.isUpdate) {

        ApplicationTriggerHandler.createOfferLetter(
            Trigger.new,
            Trigger.oldMap
        );
    }
}
