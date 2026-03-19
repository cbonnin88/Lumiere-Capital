WITH companies AS (
    SELECT 
        CAST(company_id AS INT) as company_id, 
        company_name, 
        sector, 
        country, 
        esg_score 
    FROM {{ ref('stg_companies') }}
),
investments AS (
    SELECT 
        CAST(company_id AS INT) as company_id, 
        amount_invested_eur 
    FROM {{ ref('stg_investments') }}
)

SELECT 
    i.*, 
    c.company_name, 
    c.sector,
    COALESCE(i.amount_invested_eur * (1 + (c.esg_score / 50)), 0) as current_estimated_value
FROM investments i
INNER JOIN companies c ON i.company_id = c.company_id 