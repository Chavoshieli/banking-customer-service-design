# Customer Identity & Photo Update Service - API Specification

---

## 1. Service Overview

This API is designed to manage customer identity information and profile image updates within a banking system.

The service performs a controlled workflow including:
- Customer identity validation
- Comparison of national identity document data
- External photo inquiry via government verification system
- Fee validation and deduction
- Update of customer profile and historical records

All operations are executed in a transactional manner to ensure data consistency.

## 2. Endpoint
```http
POST /api/customer/identity/photo-update
```

## 3. Request Parameters
{
  "customerId": "Integer",
  "nationalIdSerial": "String (max 10)",
  "nationalIdSeries": "String (max 5)",
  "feeAccountNumber": "String (optional)",
  "environmentCode": "Integer",
  "userId": "String (max 8)",
  "branchCode": "Integer"
}

## 4. Response Structure
{
  "errorCode": 0,
  "errorDescription": "SUCCESS",
  "internalErrorCode": 0,
  "internalErrorDescription": "",
  "status": "SUCCESS | FAILED"
}

## 5. Status Definitions
| Status  | Description                      |
| ------- | -------------------------------- |
| SUCCESS | Operation completed successfully |
| FAILED  | Operation failed                 |
| PARTIAL | Partially completed operation    |

## 6. Business Rules
If the customer national ID serial and series are unchanged, only the photo validity date is updated and the process ends.
If the national ID data has changed, an external photo inquiry is triggered.
Customer must be at least 15 years old to proceed.
Fee validation is mandatory before external inquiry.
If fee deduction fails, the entire transaction is rolled back.
All changes are logged for audit purposes.

## 7. Error Codes
| Code    | Description                             |
| ------- | --------------------------------------- |
| 0       | Success                                 |
| 1100006 | Customer not found                      |
| 230536  | Customer age is below allowed threshold |
| 230537  | Fee validation failed                   |
| 230538  | External photo inquiry failed           |
| 230540  | Tracking code generation failed         |
| 230510  | Fee withdrawal failed                   |

## 8. Transaction Behavior

This service follows a strict transactional model.

If any step after fee validation fails:

All previous operations are rolled back
No partial updates are committed

## 9. External Dependencies
External Government Photo Verification Service
Core Banking Fee Management System

## 10. Notes
This API specification is a sanitized representation for portfolio and design purposes.
No production or real customer data is included.
Internal database procedures are abstracted and not exposed in this document.
