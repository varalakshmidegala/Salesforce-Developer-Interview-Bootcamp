import { LightningElement } from 'lwc';

export default class PlacementHome extends LightningElement {

    // Student Details
    studentName = 'Rahul';
    rollNumber = '22B81A0501';
    department = 'CSE';

    // Welcome Message
    welcomeMessage = '';

    // Application Status
    applicationStatus = 'Not Applied';

    // Placement Dashboard
    todayDate = '08 August 2026';
    numberOfCompanies = 25;
    numberOfJobs = 63;
    applicationsSubmitted = 5;

    // Show Welcome Message
    showWelcomeMessage() {
        this.welcomeMessage = 'Welcome to Salesforce Development.';
    }

    // Apply for Job
    applyForJob() {
        this.applicationStatus = 'Applied';
    }
}
