SELECT 
    date_date
    ,operational_margin - ads_cost AS ads_margin
    ,average_basket
    ,operational_margin
    ,revenue
    ,margin
    ,ads_cost
    ,ads_clicks
    ,ads_impression
FROM {{ ref('finance_days') }}
JOIN {{ ref('int_campaigns_day') }} USING(date_date)
order by date_date DESC

