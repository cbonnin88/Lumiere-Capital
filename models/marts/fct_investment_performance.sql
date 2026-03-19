WITH base_investments AS (
    SELECT * FROM {{source('airbyte_raw','src_investments')}}
),
base_companies AS (
    SELECT * FROM {{source('airbyte_raw','src_companies')}}
),

joined AS (
    SELECT
        i.tx_id,
        i.company_id,
        c.company_name,
        c.sector,
        c.hq_country,
        c.esg_score,
        i.amount_eur AS captial_invested,
        -- Simulating a 'Current Valuation' (Capital * Random Growth +  ESG Bonus)
        (i.amount_eur * (1 + (c.esg_score / 100))) AS current_valuation
    FROM base_investments AS i 
    LEFT JOIN base_companies AS c 
        ON i.company_id = c.company_id
)

SELECT
    *,
    -- MOIC = Total Value / Invested Capital
    ROUND(current_valuation / captial_invested,2) AS moic,
    -- TVPI (in this simplified model, ite matches MOIC)
    ROUND(current_valuation / captial_invested,2) AS TVPI
FROM joined