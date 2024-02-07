SELECT 
    EXTRACT(MONTH FROM date_date) AS date_month
    ,sum(operational_margin - ads_cost) AS ads_margin
    ,ROUND(sum(average_basket),2) AS average_basket
    ,sum(operational_margin) AS operational_margin
    ,sum(revenue) AS revenue
    ,SUM(margin) AS margin
    ,SUM(ads_cost) AS ads_cost
    ,SUM(ads_clicks) AS ads_clicks
    ,SUM(ads_impression) AS ads_impression
FROM {{ ref('finance_days') }}
JOIN {{ ref('int_campaigns_day') }} USING(date_date)
GROUP BY date_month
ORDER BY date_month DESC