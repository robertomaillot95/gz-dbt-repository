WITH a AS (
SELECT 
    *
    ,quantity*purchase_price AS purchase_cost
    ,ROUND(revenue - (quantity*purchase_price),2) AS margin
FROM {{ ref('stg_raw__product') }}
JOIN {{ ref('stg_raw__sales') }} USING(products_id)
)
SELECT
    *
    ,{{ margin_percent('revenue','purchase_cost') }} as margin_percent
FROM a