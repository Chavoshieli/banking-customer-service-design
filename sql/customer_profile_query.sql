-- =====================================================
-- Customer Profile Query
-- Banking Customer Information Service
-- Database: DB2
-- Description:
-- Retrieves customer identity and job information
-- Supports optional secondary job records
-- =====================================================

SELECT
    c.intcustid,

    hc.nationalcode,

    CASE
        WHEN c.BusinessAcc = 1 THEN 'Yes'
        ELSE 'No'
    END AS BusinessAccount,

    j1.jobname AS primary_job,

    j2.jobname AS secondary_job

FROM customers c

INNER JOIN hcustomers hc
        ON hc.intcustid = c.intcustid

LEFT JOIN hecustomers j1
       ON j1.intcustid = c.intcustid
      AND j1.jobtype = 1

LEFT JOIN hecustomers j2
       ON j2.intcustid = c.intcustid
      AND j2.jobtype = 2
;
