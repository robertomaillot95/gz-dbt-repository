SELECT 
    MAX(operational_margin) - sum(ads_cost) AS Ads_margin
FROM {{ ref('finance_days') }}
JOIN {{ ref('int_campaigns') }} USING(date_date)
GROUP BY date_date

