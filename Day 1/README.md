
# Sprint 01 – Placement Management System

## Objective

The objective of Sprint 01 was to understand Salesforce development fundamentals by converting a real-world business requirement into a working Salesforce solution.

## Business Scenario

A college Placement Cell wants to manage student job applications using Salesforce. Companies publish job openings with eligibility criteria, students apply for jobs, and the placement team tracks each application.

## Features Implemented

* Created custom objects:

  * Student__c
  * Job__c
  * Application__c
* Designed relationships between the objects.
* Created required custom fields.
* Practiced SOQL queries for data retrieval and filtering.
* Developed an Apex class (`PlacementService`) to implement business logic.
* Created a **Before Insert Apex Trigger** to validate student eligibility based on CGPA.

## Technologies Used

* Salesforce Developer Edition
* Apex
* SOQL
* Salesforce Objects & Relationships
* VS Code
* Salesforce CLI
* Git & GitHub

## Folder Structure

```text
Source-Code/
SOQL-Queries/
Screenshots/
Learning-Notes/
Challenges/
```

## Learning Outcomes

* Designed a Salesforce data model.
* Created custom objects and lookup relationships.
* Learned SOQL query writing.
* Built Apex classes with reusable methods.
* Implemented business validation using Apex Triggers.

## Future Improvements

* Prevent duplicate job applications.
* Validate job closing dates.
* Automate application processing using Flows.
* Generate Offer Letter records automatically.
* Improve application tracking with additional automation.

## Author

**Vaishnavi Degala**

Salesforce Developer Bootcamp – Sprint 01
