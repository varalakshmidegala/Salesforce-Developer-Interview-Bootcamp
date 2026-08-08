# Sprint 06 – Apex Triggers

## Objective

The objective of this sprint was to understand Apex Triggers and build event-driven automation for the Placement Management System.

## Technologies Used

- Salesforce
- Apex
- Apex Triggers
- SOQL
- VS Code
- Salesforce CLI

## What I Built

I created an Apex Trigger for the Application__c object.

The Trigger automatically responds when a new Application is inserted.

## Trigger Events

### Before Insert

The system:

- Sets Application Status to Applied
- Validates Student CGPA
- Validates Job Closing Date
- Prevents duplicate applications

### After Update

The project contains after-update automation for Application status changes.

## Architecture

ApplicationTrigger
        ↓
ApplicationTriggerHandler
        ↓
ApplicationService
        ↓
Business Logic

The Trigger is kept short and delegates business responsibilities to other classes.

## Business Rules

### Rule 1 – Default Status

Every new Application receives:

Applied

### Rule 2 – CGPA Validation

A Student cannot apply if their CGPA is below the Job's minimum CGPA.

### Rule 3 – Closing Date

Applications cannot be submitted after the Job closing date.

### Rule 4 – Duplicate Applications

A Student cannot apply for the same Job more than once.

## Testing

The following scenarios were tested:

- Invalid CGPA → Application rejected
- Expired Job → Application rejected
- Duplicate Application → Application rejected
- Valid Application → Allowed

## Key Learning

I learned that Apex Triggers allow Salesforce to respond automatically to business events.

I also learned that a Trigger should coordinate rather than contain all business logic.

## Deployment

The Trigger and supporting Apex classes were deployed successfully to the Salesforce Placement Org.

## Screenshots

Screenshots are included in the Screenshots folder as evidence of implementation, deployment and testing.

## Conclusion

This sprint helped me understand event-driven programming in Salesforce and the importance of clean Trigger architecture.
