# Sprint 02 – Apex Triggers & Governor Limits

## Objective

The objective of Sprint 02 was to implement business rules using Apex Triggers while following Salesforce best practices, including bulkification and Governor Limit considerations.

## Business Scenario

The Placement Cell requires automation to validate student job applications. The system should ensure that only eligible students can apply, prevent duplicate applications, reject applications submitted after the job closing date, and automatically assign a default application status.

## Features Implemented

* Created a **Before Insert Apex Trigger** on `Application__c`.
* Automatically set the application status to **Applied**.
* Prevented duplicate applications for the same student and job.
* Validated student CGPA against the job's minimum CGPA.
* Prevented applications after the job closing date.
* Displayed meaningful validation error messages.
* Implemented bulkified logic using Lists, Sets, and Maps.

## Technologies Used

* Salesforce Developer Edition
* Apex
* SOQL
* Apex Triggers
* VS Code
* Salesforce CLI
* Git & GitHub

## Folder Structure

```text
Source-Code/
Screenshots/
Learning-Notes/
Challenges/
```

## Learning Outcomes

* Understood the lifecycle of Apex Triggers.
* Learned the difference between Before and After Triggers.
* Implemented bulkified trigger logic following Governor Limit best practices.
* Used Lists, Sets, and Maps to process multiple records efficiently.
* Applied business validations using Apex.

## Future Improvements

* Implement the Trigger Handler Pattern for better code organization.
* Move business logic into a dedicated service class.
* Add unit test classes with high code coverage.
* Extend automation using Flows where appropriate.

## Author

**Vaishnavi Degala**

Salesforce Developer Bootcamp – Sprint 02

