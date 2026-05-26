# API Design

## Get Customer Profile

### Request

GET /api/customers/{customerId}

### Response

json
{
  "customerId": 1001,
  "nationalCode": "0012345678",
  "businessAccount": true,
  "primaryJob": "Engineer",
  "secondaryJob": "Consultant"
}

### Error Handling

| Error Code | Description |
|------------|-------------|
| 400 | Invalid request |
| 404 | Customer not found |
| 500 | Internal server error |
