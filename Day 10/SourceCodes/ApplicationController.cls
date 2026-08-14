public with sharing class ApplicationController {

    // Get all applications for a student
    @AuraEnabled(cacheable=true)
    public static List<Application__c> getMyApplications(Id studentId) {

        return [
            SELECT Id,
                   Name,
                   Student__c,
                   Job__c,
                   Job__r.Name,
                   Job__r.Company__c,
                   Job__r.Location__c,
                   Job__r.Minimum_CGPA__c,
                   Job__r.Closing_Date__c,
                   Status__c,
                   Applicationn_Date__c
            FROM Application__c
            WHERE Student__c = :studentId
            ORDER BY CreatedDate DESC
        ];
    }


    // Create a new application
    @AuraEnabled
    public static Application__c createApplication(
        Id studentId,
        Id jobId
    ) {

        // Check whether student already applied for this job
        List<Application__c> existingApplications = [
            SELECT Id
            FROM Application__c
            WHERE Student__c = :studentId
            AND Job__c = :jobId
            LIMIT 1
        ];

        if (!existingApplications.isEmpty()) {
            throw new AuraHandledException(
                'You have already applied for this job.'
            );
        }


        // Get Student
        Student__c student = [
            SELECT Id, CGPA__c
            FROM Student__c
            WHERE Id = :studentId
            LIMIT 1
        ];


        // Get Job
        Job__c job = [
            SELECT Id,
                   Minimum_CGPA__c,
                   Closing_Date__c
            FROM Job__c
            WHERE Id = :jobId
            LIMIT 1
        ];


        // CGPA validation
        if (student.CGPA__c == null ||
            job.Minimum_CGPA__c == null ||
            student.CGPA__c < job.Minimum_CGPA__c) {

            throw new AuraHandledException(
                'You are not eligible for this job.'
            );
        }


        // Closing date validation
        if (job.Closing_Date__c != null &&
            Date.today() > job.Closing_Date__c) {

            throw new AuraHandledException(
                'Applications are closed for this job.'
            );
        }


        // Create Application
        Application__c application = new Application__c();

        application.Student__c = studentId;
        application.Job__c = jobId;
        application.Applicationn_Date__c = Date.today();
        application.Status__c = 'Applied';

        insert application;

        return application;
    }
}