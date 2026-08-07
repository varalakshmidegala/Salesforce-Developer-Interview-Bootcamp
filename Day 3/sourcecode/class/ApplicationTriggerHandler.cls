public class ApplicationTriggerHandler {

    // Business Rule 1: Set Status to Applied
    public static void beforeInsert(List<Application__c> applications) {

        for (Application__c app : applications) {
            app.Status__c = 'Applied';
        }

    }

    // Business Rule 2: Validate Student CGPA
    public static void validateCGPA(List<Application__c> applications) {

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

        Map<Id, Student__c> students = new Map<Id, Student__c>(
            [SELECT Id, CGPA__c
             FROM Student__c
             WHERE Id IN :studentIds]
        );

        Map<Id, Job__c> jobs = new Map<Id, Job__c>(
            [SELECT Id, Minimum_CGPA__c
             FROM Job__c
             WHERE Id IN :jobIds]
        );

        for (Application__c app : applications) {

            Student__c student = students.get(app.Student__c);
            Job__c job = jobs.get(app.Job__c);

            if (student != null && job != null &&
                student.CGPA__c < job.Minimum_CGPA__c) {

                app.addError('Student CGPA does not meet the Job requirement.');

            }
        }

    }

    // Business Rule 3: Prevent Duplicate Applications
    public static void preventDuplicateApplication(List<Application__c> applications) {

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
            existingPairs.add(app.Student__c + '-' + app.Job__c);
        }

        for (Application__c app : applications) {

            String pair = app.Student__c + '-' + app.Job__c;

            if (existingPairs.contains(pair)) {
                app.addError('Student has already applied for this job.');
            }

        }
        
    }
    // Business Rule 4: Validate Job Closing Date
public static void validateClosingDate(List<Application__c> applications) {

    Set<Id> jobIds = new Set<Id>();

    for (Application__c app : applications) {

        if (app.Job__c != null) {
            jobIds.add(app.Job__c);
        }

    }

    Map<Id, Job__c> jobs = new Map<Id, Job__c>(
        [SELECT Id, Closing_Date__c
         FROM Job__c
         WHERE Id IN :jobIds]
    );

    for (Application__c app : applications) {

        Job__c job = jobs.get(app.Job__c);

        if (job != null &&
            job.Closing_Date__c != null &&
            Date.today() > job.Closing_Date__c) {

            app.addError('Applications cannot be submitted after the job closing date.');

        }

    }

}
public static void createOfferLetter(List<Application__c> newApplications,
                                     Map<Id, Application__c> oldMap) {

    List<Offer_Letter__c> offerLetters = new List<Offer_Letter__c>();

    for (Application__c app : newApplications) {

        Application__c oldApp = oldMap.get(app.Id);

        if (app.Status__c == 'Selected' &&
            oldApp.Status__c != 'Selected') {

            Offer_Letter__c offer = new Offer_Letter__c();

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
