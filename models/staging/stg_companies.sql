WITH source AS (
    SELECT * FROM {{source('airbyte_raw','src_companies')}}
)

SELECT
    CAST(company_id AS INT) as company_id,
    CAST(company_name AS STRING) AS company_name,
    CAST(hq_country AS STRING) AS country,
    CAST(sector AS STRING) AS sector,
    CAST(esg_score AS FLOAT) AS esg_score
FROM source