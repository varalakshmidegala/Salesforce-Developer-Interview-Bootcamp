# Day 5 – SOQL, DML & Apex Business Logic

## Objective

The objective of Day 5 was to practice SOQL, DML and Apex business logic
using the Placement Management System.

## Salesforce Objects Used

- Student__c
- Job__c
- Application__c

## Topics Covered

### SOQL

- SELECT
- WHERE
- AND
- ORDER BY
- ASC
- DESC
- LIMIT
- NULL checking
- Duplicate application checking

### DML

- INSERT
- UPDATE
- DELETE
- Bulk DML

## Practical Work

### Student

Retrieved Student records and checked Student CGPA.

### Job

Retrieved Job records and checked Minimum CGPA.

### Application

Retrieved existing Applications and performed duplicate checking
using Student and Job.

### ApplicationService

Created an Apex service class to handle Application-related business
logic.

The service includes:

- Student retrieval
- Job retrieval
- Duplicate application checking
- Eligibility validation
- Application creation

## Business Flow

Student
↓
Job
↓
Check Eligibility
↓
Check Duplicate Application
↓
Create Application
↓
Set Status as Applied

## DML Flow

Validation
↓
INSERT Application

Existing Application
↓
UPDATE Status

## Deployment

The Apex class was successfully deployed to the PlacementOrg.

## Key Learning

SOQL is used to retrieve Salesforce records.

DML is used to create, update and delete Salesforce records.

Business validation should be completed before performing DML.

## Status

Day 5 completed.
