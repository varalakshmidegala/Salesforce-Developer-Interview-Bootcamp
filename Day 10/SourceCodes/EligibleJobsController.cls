public with sharing class EligibleJobsController {

    @AuraEnabled(cacheable=true)
    public static List<Job__c> getEligibleJobs(Id studentId) {

        Student__c student = [
            SELECT Id, CGPA__c
            FROM Student__c
            WHERE Id = :studentId
            LIMIT 1
        ];

        return [
            SELECT Id,
                   Name,
                   Company__c,
                   Location__c,
                   Minimum_CGPA__c,
                   Closing_Date__c
            FROM Job__c
            WHERE Minimum_CGPA__c <= :student.CGPA__c
            ORDER BY Closing_Date__c ASC
        ];
    }
}