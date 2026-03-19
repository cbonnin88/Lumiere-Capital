WITH companies AS (
    SELECT * FROM {{ ref('stg_companies') }}
),
investments AS (
    SELECT * FROM {{ ref('stg_investments') }}
)

SELECT
    i.transcations_id,
    i.company_id,
    c.company_name,
    c.sector,
    c.country,
    c.esg_score,
    i.amount_invested_eur,
    -- Simple logic: Valuation = Invested * (ESG Score / 20)
    (i.amount_invested_eur * (c.esg_score / 20.0)) AS current_estimated_value,
    -- MOIC = Valuation / Invested
    ((i.amount_invested_eur * (c.esg_score / 20.0)) / NULLIF(i.amount_invested_eur, 0)) AS moic
FROM investments i
INNER JOIN companies c ON i.company_id = c.company_id