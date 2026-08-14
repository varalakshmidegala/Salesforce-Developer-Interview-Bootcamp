import { LightningElement } from 'lwc';
import getMyApplications from '@salesforce/apex/ApplicationController.getMyApplications';

export default class OfferSummary extends LightningElement {

    applications = [];

    studentId = 'a00g500000rOX1lAAG';

    connectedCallback() {
        this.loadApplications();
    }

    loadApplications() {

        getMyApplications({
            studentId: this.studentId
        })
        .then(result => {

            this.applications = result.filter(
                application => application.Status__c === 'Selected'
            );

        })
        .catch(error => {

            console.error('Error loading offers:', error);

        });
    }
}