WITH base_calculations AS (
    SELECT
        products_id,
        date_date,
        orders_id,
        revenue,
        quantity,
        purchase_price,
        quantity * purchase_price AS raw_purchase_cost,
        revenue - (quantity * purchase_price) AS raw_margin
    FROM {{ ref("stg_raw__sales") }} s
    LEFT JOIN {{ ref("stg_raw__product") }} p
        USING (products_id)
)

SELECT
    products_id,
    date_date,
    orders_id,
    revenue,
    quantity,
    purchase_price,
    ROUND(raw_purchase_cost, 2) AS purchase_cost,
    ROUND(raw_margin, 2) AS margin,
    {{ margin_percent('revenue', 'raw_purchase_cost') }} AS margin_percent
FROM base_calculations
