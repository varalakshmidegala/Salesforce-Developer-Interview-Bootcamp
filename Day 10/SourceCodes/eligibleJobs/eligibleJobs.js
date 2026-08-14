import { LightningElement } from 'lwc';
import getEligibleJobs from '@salesforce/apex/EligibleJobsController.getEligibleJobs';
import createApplication from '@salesforce/apex/ApplicationController.createApplication';

export default class EligibleJobs extends LightningElement {

    jobs = [];
    studentId = 'a00g500000rOX1lAAG';

    connectedCallback() {
        this.loadEligibleJobs();
    }

    loadEligibleJobs() {

        getEligibleJobs({
            studentId: this.studentId
        })
        .then(result => {
            this.jobs = result;
        })
        .catch(error => {
            console.error('Error loading eligible jobs:', error);
        });
    }

    handleApply(event) {

        const jobId = event.detail.jobId;

        createApplication({
            studentId: this.studentId,
            jobId: jobId
        })
        .then(() => {

            alert('Application submitted successfully!');

            this.loadEligibleJobs();

        })
        .catch(error => {

            console.error('Application error:', error);

            alert(
                error.body?.message ||
                'Unable to submit application.'
            );

        });
    }
}