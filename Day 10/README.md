# Day 10 – Salesforce LWC Placement Portal

## Objective

Build and integrate Lightning Web Components (LWC) for the Placement Management System and connect them with Apex controllers.

## Work Completed

* Created and deployed LWC components for the Placement Portal.
* Created an Eligible Jobs component to display jobs based on student eligibility.
* Created Job Card and Application Card components.
* Created My Applications component to display a student's applications.
* Created Offer Summary component to display selected applications.
* Connected LWC components with Apex methods using `@salesforce/apex`.
* Created `ApplicationController` methods for retrieving and creating applications.
* Implemented application duplicate checking.
* Implemented CGPA eligibility validation.
* Implemented job closing-date validation.
* Verified application records using SOQL.
* Added the components to the Placement Portal Lightning App Page.
* Successfully deployed the LWC components using Salesforce CLI.

## LWC Components

### eligibleJobs

Displays jobs for which the student is eligible.

### jobCard

Displays individual job information and provides actions such as View Details and Apply.

### applicationCard

Displays application-related information.

### myApplications

Displays all applications submitted by the current test student.

### offerSummary

Displays applications whose status is `Selected`.

## Apex Integration

The LWC components communicate with Apex controllers to retrieve and create Salesforce records.

## Deployment

All completed components were deployed successfully to the Salesforce org using Salesforce CLI.

## Key Outcome

Successfully integrated Apex and LWC to create a functional Placement Portal application.

