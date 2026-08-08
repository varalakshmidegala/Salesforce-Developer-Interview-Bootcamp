public class ApplicationTriggerHandler {

    // Set Status to Applied
    public static void beforeInsert(List<Application__c> applications) {

        for (Application__c app : applications) {
            app.Status__c = 'Applied';
        }
    }


    // Prevent Duplicate Applications
    public static void preventDuplicateApplication(
        List<Application__c> applications
    ) {

        Set<Id> studentIds = new Set<Id>();
        Set<Id> jobIds = new Set<Id>();

        for (Application__c app : applications) {

            if (app.Student__c != null) {
                studentIds.add(app.Student__c);
            }

            if (app.Job__c != null) {
                jobIds.add(app.Job__c);
            }
        }

        List<Application__c> existingApplications = [
            SELECT Id, Student__c, Job__c
            FROM Application__c
            WHERE Student__c IN :studentIds
            AND Job__c IN :jobIds
        ];

        Set<String> existingPairs = new Set<String>();

        for (Application__c app : existingApplications) {
            existingPairs.add(
                app.Student__c + '-' + app.Job__c
            );
        }

        for (Application__c app : applications) {

            String pair =
                app.Student__c + '-' + app.Job__c;

            if (existingPairs.contains(pair)) {
                app.addError(
                    'Student has already applied for this job.'
                );
            }
        }
    }


    // Create Offer Letter when Application becomes Selected
    public static void createOfferLetter(
        List<Application__c> newApplications,
        Map<Id, Application__c> oldMap
    ) {

        List<Offer_Letter__c> offerLetters =
            new List<Offer_Letter__c>();

        for (Application__c app : newApplications) {

            Application__c oldApp = oldMap.get(app.Id);

            if (app.Status__c == 'Selected' &&
                oldApp.Status__c != 'Selected') {

                Offer_Letter__c offer =
                    new Offer_Letter__c();

                offer.Application__c = app.Id;
                offer.Status__c = 'Generated';
                offer.Offer_Date__c = Date.today();

                offerLetters.add(offer);
            }
        }

        if (!offerLetters.isEmpty()) {
            insert offerLetters;
        }
    }
}
