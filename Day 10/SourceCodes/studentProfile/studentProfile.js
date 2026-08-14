import { LightningElement, api } from 'lwc';

export default class StudentProfile extends LightningElement {

    // Rahul Kumar's Student__c record Id
    @api studentId = 'a00g500000rOX1lAAG';

    // UI messages
    successMessage = '';
    errorMessage = '';

    // Called after successful LDS save
    handleSuccess(event) {

        this.successMessage = 'Profile updated successfully.';
        this.errorMessage = '';

        // Notify the parent component
        this.dispatchEvent(
            new CustomEvent('profileupdated', {
                detail: {
                    studentId: this.studentId
                }
            })
        );

        // Remove success message after 4 seconds
        setTimeout(() => {
            this.successMessage = '';
        }, 4000);
    }

    // Called when LDS save fails
    handleError(event) {

        this.errorMessage =
            'We could not update your profile. Please review the fields and try again.';

        this.successMessage = '';

        console.error(
            'Profile update error:',
            event.detail
        );
    }
}