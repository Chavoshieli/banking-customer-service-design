-- =========================================================
-- DESIGN RATIONALE
-- =========================================================

-- 1. JOIN STRATEGY

-- The query is designed using a normalized data model where
-- customer information is distributed across multiple domains:

-- - CUSTOMER_MASTER: core customer identifiers and account metadata
-- - CUSTOMER_PERSONAL: personal identity attributes (name, national ID, birth data)
-- - ORGANIZATION_BRANCH: branch reference and organizational context
-- - CUSTOMER_EXTRA_INFO: optional extended attributes (e.g. follow-up codes)

-- INNER JOIN is used for mandatory relationships to ensure
-- data integrity (customer must exist in both master and personal tables).

-- LEFT JOIN is used for optional/auxiliary data (extra info),
-- ensuring that missing non-critical data does not block the response.

-- =========================================================
-- 2. CUSTOMER IDENTIFICATION STRATEGY
-- =========================================================

-- The query supports dual identification mechanisms:

-- - Internal Customer ID (preferred identifier)
-- - External Customer ID (fallback identifier)

-- Priority is given to Internal Customer ID due to its stability
-- and system-controlled nature. External ID is used only when
-- Internal ID is not provided.

-- This design ensures deterministic customer resolution while
-- supporting integration scenarios with external systems.

-- =========================================================
-- 3. FILTERING AND PERFORMANCE CONSIDERATION
-- =========================================================

-- Conditional filtering logic is used instead of a simple OR condition
-- to improve index utilization and query performance.

-- This avoids full table scan scenarios on large customer datasets
-- and ensures that only one access path is used per execution.

-- =========================================================
-- 4. DATA CONSISTENCY AND NULL HANDLING
-- =========================================================
--
-- COALESCE is applied on optional fields such as FOLLOW_CODE
-- to ensure consistent output contract for downstream services.

-- This prevents NULL propagation into service layer logic.

-- =========================================================
-- 5. RESULT DETERMINISM
-- =========================================================

-- FETCH FIRST 1 ROW ONLY is used to guarantee single-record output,
-- ensuring deterministic behavior in service orchestration.

-- =========================================================
-- 6. DESIGN INTENT

-- This query is part of a Customer Profile Retrieval Service and is
-- designed to act as a foundational data provider for:

-- - Identity validation workflows
-- - National ID update services
-- - Photo inquiry decision processes
-- - Customer enrichment pipelines

-- =========================================================
