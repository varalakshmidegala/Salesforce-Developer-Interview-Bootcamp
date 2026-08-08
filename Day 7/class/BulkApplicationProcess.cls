public class BulkApplicationProcessor {

    public static void validateApplications(
        List<Application__c> applications
    ) {

        Set<Id> studentIds = new Set<Id>();

        for (Application__c app : applications) {

            if (app.Student__c != null) {
                studentIds.add(app.Student__c);
            }
        }

        Map<Id, Student__c> students = new Map<Id, Student__c>(
            [
                SELECT Id, Name, CGPA__c
                FROM Student__c
                WHERE Id IN :studentIds
            ]
        );

        for (Application__c app : applications) {

            Student__c student = students.get(app.Student__c);

            if (student != null) {

                if (student.CGPA__c >= 7) {
                    app.Status__c = 'Eligible';
                } else {
                    app.Status__c = 'Rejected';
                }
            }
        }
    }
}
