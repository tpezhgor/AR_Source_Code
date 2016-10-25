CREATE OR REPLACE VIEW
    METRICS.V_AR_ASIA_DSO_YTY AS
SELECT
    A.MONTH_END_DATE,
    A.NEXT_MONTH_END_DATE,
    A.NEXT_QUARTER_END_DATE,
    A.UPLOAD_TIME_STAMP,
    A.UPLOAD_DATE,
    A.MONTH_END_FLAG,
    A.DETAIL_AVAILABLE,
    A.ITEM_KEY,
    A.L6,
    A.L5,
    A.L4,
    A.L3,
    A.L2,
    A.L1,
    A."LEVEL",
    A.COLLECTION_MANAGER,
    A.AR_TYPE,
    A.AR_CATEGORY,
    A.BRAND_DESC,
    A.SUB_BRAND_DESC,
    A.ACTUAL_RES_DSO,
    A.ACTUAL_DSO,
    A.ACTUAL_AR,
    A.ACTUAL_REV,
    A.ACTUAL_BILLED_AND_AGED_AR,
    A.ACTUAL_BNYD_AR,
    A.ACTUAL_UNBILLED_AR,
    A.ACTUAL_REVENUE_PROVISION_AR,
    A.ACTUAL_SUSPENSE_AR,
    A.ACTUAL_NOTES_AND_NON_CURRENT_AR,
    A.ACTUAL_CURRENT,
    A.ACTUAL_DELIQUENT,
    A.ACTUAL_OV90,
    A.ACTUAL_RES_AR,
    A.ACTUAL_RES_REV,
    A.REPORTING_YEAR,
    A.PROCESS_YEAR,
    A.PROCESS_MONTH,
    A.PROCESS_QUARTER,
    A.LEVELNUMERIC
FROM
    (
        SELECT
            A.MONTH_END_DATE,
            A.NEXT_MONTH_END_DATE,
            A.NEXT_QUARTER_END_DATE,
            A.UPLOAD_TIME_STAMP,
            A.UPLOAD_DATE,
            A.MONTH_END_FLAG,
            A.DETAIL_AVAILABLE,
            A.ITEM_KEY,
            A.L6,
            A.L5,
            A.L4,
            A.L3,
            A.L2,
            A.L1,
            A."LEVEL",
            A.COLLECTION_MANAGER,
            A.AR_TYPE,
            A.AR_CATEGORY,
            A.BRAND_DESC,
            A.SUB_BRAND_DESC,
            A.ACTUAL_RES_DSO,
            A.ACTUAL_DSO,
            A.ACTUAL_AR,
            A.ACTUAL_REV,
            A.ACTUAL_BILLED_AND_AGED_AR,
            A.ACTUAL_BNYD_AR,
            A.ACTUAL_UNBILLED_AR,
            A.ACTUAL_REVENUE_PROVISION_AR,
            A.ACTUAL_SUSPENSE_AR,
            A.ACTUAL_NOTES_AND_NON_CURRENT_AR,
            A.ACTUAL_CURRENT,
            A.ACTUAL_DELIQUENT,
            A.ACTUAL_OV90,
            A.ACTUAL_RES_AR,
            A.ACTUAL_RES_REV,
            A.REPORTING_YEAR,
            A.PROCESS_YEAR,
            A.PROCESS_MONTH,
            A.PROCESS_QUARTER,
            A.LEVELNUMERIC,
            ROW_NUMBER() OVER ( PARTITION BY A.PROCESS_YEAR, A.PROCESS_MONTH, A.PROCESS_QUARTER,
            A."LEVEL", A.AR_TYPE, A.AR_CATEGORY, A.BRAND_DESC ORDER BY A.REPORTING_YEAR DESC) AS RN
        FROM
            METRICS.AR_ASIA_DSO A) A
WHERE
    (
        A.RN = 1);