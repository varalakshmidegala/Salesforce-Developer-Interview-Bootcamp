import { LightningElement } from 'lwc';

export default class PlacementHome extends LightningElement {

    // Rahul Kumar's Student__c record
    studentId = 'a00g500000rOX1lAAG';

    // Student Details
    studentName = 'Rahul Kumar';
    rollNumber = '22B81A0501';
    department = 'CSE';

    // Welcome Message
    welcomeMessage = '';

    // Profile Communication
    profileUpdateMessage = '';

    // Application Status
    applicationStatus = 'Not Applied';

    // Placement Dashboard
    todayDate = '13 August 2026';
    numberOfCompanies = 25;
    numberOfJobs = 63;
    applicationsSubmitted = 5;

    // Show Welcome Message
    showWelcomeMessage() {
        this.welcomeMessage =
            'Welcome to Salesforce Development.';
    }

    // Apply for Job
    applyForJob() {
        this.applicationStatus = 'Applied';
    }

    // Child → Parent communication
    handleProfileUpdated(event) {

        const updatedStudentId = event.detail.studentId;

        console.log(
            'Profile updated for Student:',
            updatedStudentId
        );

        this.profileUpdateMessage =
            'Student profile updated successfully.';

        // Remove message after 4 seconds
        setTimeout(() => {
            this.profileUpdateMessage = '';
        }, 4000);
    }
}