# Sprint 07 – Bulk Processing and Governor Limits

## Objective

The objective of this sprint was to understand Salesforce Governor Limits and learn how to write bulkified Apex code.

## Topics Covered

- Governor Limits
- Bulkification
- SOQL inside loops
- DML inside loops
- Lists
- Sets
- Maps
- Collection-based processing

## Practical Implemented

I created:

### BulkApplicationProcessor

This Apex class processes Applications in bulk.

The class:

1. Receives a List of Applications.
2. Collects Student IDs using a Set.
3. Performs one SOQL query outside the loop.
4. Stores Students in a Map.
5. Processes Applications using the Map.

### BulkApplicationTrigger

The Trigger calls the bulk-processing class during Application insertion.

## Bulkification Pattern

Applications
↓
Collect Student IDs
↓
ONE SOQL Query
↓
Student Map
↓
Process Applications

## Why Bulkification Is Important

A Trigger may receive many records in a single transaction.

Code that works for one record may fail when processing hundreds of records.

Bulkified Apex reduces unnecessary database operations and helps stay within Salesforce Governor Limits.

## Deployment

The Apex class and Trigger were deployed successfully to the PlacementOrg Salesforce org.

## Testing

The bulk-processing logic was tested using Application records with different Student CGPA values.

## Key Learning

The most important lesson from this sprint was to think in collections rather than individual records.

Instead of:

Get one record → Query → Process

I learned to use:

Collect → Query Once → Map → Process

## Conclusion

This sprint improved my understanding of scalable Apex development and Governor Limits.

I learned why SOQL and DML should not be unnecessarily placed inside loops and how Sets, Maps and Lists help create bulk-safe Apex.
