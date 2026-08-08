public with sharing class ApplicationService {

    // 1. Retrieve Student information
    public static Student__c getStudent(Id studentId) {

        Student__c student = [
            SELECT Id, Name, CGPA__c, Department__c
            FROM Student__c
            WHERE Id = :studentId
            LIMIT 1
        ];

        return student;
    }


    // 2. Retrieve Job information
    public static Job__c getJob(Id jobId) {

        Job__c job = [
            SELECT Id, Name, Company__c, Minimum_CGPA__c, Closing_Date__c
            FROM Job__c
            WHERE Id = :jobId
            LIMIT 1
        ];

        return job;
    }


    // 3. Check for duplicate application
    public static List<Application__c> checkDuplicateApplication(
        Id studentId,
        Id jobId
    ) {

        List<Application__c> existingApplications = [
            SELECT Id,
                   Name,
                   Student__c,
                   Job__c,
                   Status__c
            FROM Application__c
            WHERE Student__c = :studentId
            AND Job__c = :jobId
        ];

        return existingApplications;
    }


    // 4. Validate Student eligibility
    public static Boolean isEligible(
        Student__c student,
        Job__c job
    ) {

        if (student.CGPA__c == null ||
            job.Minimum_CGPA__c == null) {

            return false;
        }

        return student.CGPA__c >= job.Minimum_CGPA__c;
    }


    // 5. Create a new Application
    public static Application__c createApplication(
        Id studentId,
        Id jobId
    ) {

        Application__c application = new Application__c();

        application.Student__c = studentId;
        application.Job__c = jobId;
        application.Applicationn_Date__c = Date.today();
        application.Status__c = 'Applied';

        insert application;

        return application;
    }


    // 6. Day 6 - Validate Applications before insert
    public static void validateApplications(
        List<Application__c> applications
    ) {

        Set<Id> studentIds = new Set<Id>();
        Set<Id> jobIds = new Set<Id>();

        // Collect Student and Job IDs
        for (Application__c app : applications) {

            if (app.Student__c != null) {
                studentIds.add(app.Student__c);
            }

            if (app.Job__c != null) {
                jobIds.add(app.Job__c);
            }
        }


        // Query Students
        Map<Id, Student__c> students = new Map<Id, Student__c>(
            [
                SELECT Id, CGPA__c
                FROM Student__c
                WHERE Id IN :studentIds
            ]
        );


        // Query Jobs
        Map<Id, Job__c> jobs = new Map<Id, Job__c>(
            [
                SELECT Id, Minimum_CGPA__c, Closing_Date__c
                FROM Job__c
                WHERE Id IN :jobIds
            ]
        );


        // Validate each Application
        for (Application__c app : applications) {

            Student__c student = students.get(app.Student__c);
            Job__c job = jobs.get(app.Job__c);


            // CGPA validation
            if (student != null &&
                job != null &&
                student.CGPA__c != null &&
                job.Minimum_CGPA__c != null &&
                student.CGPA__c < job.Minimum_CGPA__c) {

                app.addError(
                    'Student CGPA does not meet the Job requirement.'
                );
            }


            // Closing date validation
            if (job != null &&
                job.Closing_Date__c != null &&
                Date.today() > job.Closing_Date__c) {

                app.addError(
                    'Applications cannot be submitted after the job closing date.'
                );
            }
        }
    }
}
