public class ApplicationScheduledProcessor implements Schedulable {

    public void execute(SchedulableContext context) {

        List<Application__c> applications = [
            SELECT Id, Name, Status__c
            FROM Application__c
            LIMIT 50
        ];

        for (Application__c app : applications) {

            System.debug(
                'Scheduled processing: ' + app.Name
            );

            System.debug(
                'Application Status: ' + app.Status__c
            );
        }
    }
}
