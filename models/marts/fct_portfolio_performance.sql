WITH companies AS (
    SELECT * FROM {{ref('stg_companies')}}
),

investments AS (
    SELECT * FROM {{ref('stg_investments')}}
),

calculations AS (
    SELECT
        i.*,
        c.company_name,
        c.sector,
        c.country,
        c.esg_score,
        -- LOGIC: Better ESG scores lead to highter projected valuations
        -- Formula: Investment * (1 + (ESG SCORE / 50))
        (i.amount_invested_eur * (1 +(c.esg_score / 50))) AS current_estimated_value
    FROM investments AS i
    LEFT JOIN companies AS c 
        ON i.company_id = c.company_id
)

SELECT
    *,
    -- Financial Metric: MOIC (Current Value / Investesd Capital)
    ROUND(current_estimated_value / amount_invested_eur,2) AS moic,
    CASE
        WHEN (current_estimated_value / amount_invested_eur) >= 2.5 THEN 'Top Tier'
        WHEN (current_estimated_value / amount_invested_eur) >= 1.5 THEN 'Mid Tier'
        ELSE 'Underperforming'
    END AS performance_basket
FROM calculations