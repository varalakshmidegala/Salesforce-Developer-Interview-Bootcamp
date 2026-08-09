public class ApplicationFutureService {

    @future
    public static void processApplicationAsync(Id applicationId) {

        Application__c application = [
            SELECT Id, Name, Status__c
            FROM Application__c
            WHERE Id = :applicationId
            LIMIT 1
        ];

        System.debug(
            'Future processing started for Application: ' +
            application.Name
        );

        System.debug(
            'Application Status: ' +
            application.Status__c
        );
    }
}
