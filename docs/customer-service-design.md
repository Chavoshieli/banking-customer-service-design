# Customer Service Design

## Objective
This service retrieves customer profile information from a DB2 banking system.

## Functional Requirements
- Retrieve customer identity information
- Retrieve primary job information
- Retrieve secondary job information if available
- Identify business accounts

## Database Design
The solution uses the following tables:

- customers
- hcustomers
- hecustomers

## Technical Notes
- DB2 database
- Optimized joins
- LEFT JOIN used for optional records
- CASE statement used for business account identification

## Business Rules
- Each customer may have one primary job
- Secondary job information is optional
- BusinessAcc = 1 indicates a business account
