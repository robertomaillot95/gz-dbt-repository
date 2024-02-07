SELECT
    date_date
    , sum(ads_cost) AS ads_cost
    , sum(impression) AS ads_impression
    , sum(click) AS ads_clicks
FROM {{ ref('int_campaigns') }}
GROUP BY date_date
ORDER BY date_date