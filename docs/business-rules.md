# Business Rules

## Customer Employment Rules

- Each customer may have one primary job.
- Secondary job information is optional.
- Employment information is stored in the hecustomers table.

## Business Account Rules

- BusinessAcc = 1 indicates a business account.
- BusinessAcc = 0 indicates a personal account.

## Data Retrieval Rules

- Customer information must be retrieved from DB2.
- Optional information must use LEFT JOIN.
