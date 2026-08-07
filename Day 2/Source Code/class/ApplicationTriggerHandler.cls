public class ApplicationTriggerHandler {

    public static void beforeInsert(List<Application__c> newApplications) {

        // Business Rule 1
        // Automatically set Status to Applied

        for (Application__c app : newApplications) {
            app.Status__c = 'Applied';
        }

    }

}
