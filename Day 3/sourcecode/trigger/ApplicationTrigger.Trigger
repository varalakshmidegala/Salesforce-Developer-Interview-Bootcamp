trigger ApplicationTrigger on Application__c (before insert, after update) {

    if (Trigger.isBefore && Trigger.isInsert) {

        ApplicationTriggerHandler.beforeInsert(Trigger.new);
        ApplicationTriggerHandler.validateCGPA(Trigger.new);
        ApplicationTriggerHandler.preventDuplicateApplication(Trigger.new);
        ApplicationTriggerHandler.validateClosingDate(Trigger.new);

    }

    if (Trigger.isAfter && Trigger.isUpdate) {

        ApplicationTriggerHandler.createOfferLetter(
            Trigger.new,
            Trigger.oldMap
        );

    }

}
