WITH source AS (
    SELECT * FROM {{source('airbyte_raw','src_investments')}}
)

SELECT
    CAST(tx_id AS INT) AS transcations_id,
    CAST(company_id AS INT) AS company_id,
    CAST(investment_date AS DATE) AS invested_at,
    CAST(round AS STRING) AS funding_round,
    CAST(amount_eur AS DECIMAL(18,2)) AS amount_invested_eur,
    CAST(equity_pct AS FLOAT) AS equity_percentage
FROM source