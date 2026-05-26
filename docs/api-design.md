# API Design

## Get Customer Profile

### Request

GET /api/customers/{customerId}

### Response

```json
{
  "customerId": 1001,
  "nationalCode": "0012345678",
  "businessAccount": true,
  "primaryJob": "Engineer",
  "secondaryJob": "Consultant"
}
