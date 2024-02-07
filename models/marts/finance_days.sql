{{ config(materialized='table') }}

WITH a AS(
SELECT 
    orders_id
    ,date_date
    ,ROUND(sum(revenue),2) AS revenue
    ,ROUND(SUM(quantity),2) AS quantity
    ,ROUND(SUM(quantity*purchase_price),2) AS purchase_cost
    ,ROUND(SUM(ROUND(revenue - (quantity*purchase_price),2)),2) AS margin
FROM {{ ref('stg_raw__sales') }}
JOIN {{ ref('stg_raw__product') }} USING(products_id)
GROUP BY orders_id, date_date
)
SELECT 
    date_date
    ,count(orders_id) AS nb_transaction
    ,round(sum(revenue),0) as revenue
    ,round(sum(revenue)/count(orders_id),1) AS average_basket
    ,round(sum(margin),0) As margin
    ,ROUND(SUM(margin + shipping_fee - logcost - ship_cost),0) AS operational_margin
FROM a
JOIN {{ ref('stg_raw__ship') }} USING(orders_id)
GROUP BY date_date
ORDER BY date_date DESC