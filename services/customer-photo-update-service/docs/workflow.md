## Core Workflow

### Step 1 - Retrieve Customer Profile
Retrieve customer profile information using internal/external customer identifiers.

---

### Step 2 - Validate Identity Data
Validate consistency of national ID series and serial against stored customer data.

---

### Step 3 - Decision Point: Identity Change Check

- If national ID data is unchanged:
  - Proceed to Step 4A
- If national ID data is changed:
  - Proceed to Step 4B

---

### Step 4A - No Identity Change Path
Update photo validity date only and terminate workflow successfully.

---

### Step 4B - Identity Change Path

#### 4B.1 Fee Validation
Check fee configuration, account validity, and available balance.

If validation fails → terminate workflow with error.

---

#### 4B.2 External Photo Inquiry
Call external government photo verification service.

Store tracking code and response result.

If external service fails → rollback transaction and terminate.

---

#### 4B.3 Fee Deduction
Deduct service fee from customer account.

If deduction fails → rollback entire transaction.

---

### Step 5 - Update Customer Records
Update:
- Identity information
- Photo inquiry result
- Audit and tracking data

---

### Step 6 - Response Generation
Return final response including:
- Operation status
- Error code (if any)
- Tracking reference (if applicable)
