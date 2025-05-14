WITH campaign_data AS (
  SELECT
    date_date,
    ads_cost,
    impression AS ads_impression,
    click AS ads_clicks,
  FROM {{ ref('int_campaigns_day') }}
),

finance_data AS (
  SELECT
    date_date,
    average_basket,
    operational_margin,
    quantity,
    revenue,
    purchase_cost,
    margin,
    shipping_fee,
    logcost,
    ship_cost
  FROM {{ ref('finance_days') }}
)

SELECT
  c.date_date AS date,
  ROUND(operational_margin - ads_cost, 2) AS ads_margin,
  f.average_basket,
  f.operational_margin,
  c.ads_cost,
  c.ads_impression,
  c.ads_clicks,
  f.quantity,
  f.revenue,
  f.purchase_cost,
  f.margin,
  f.shipping_fee,
  f.logcost,
  f.ship_cost
FROM campaign_data c
JOIN finance_data f
  ON c.date_date = f.date_date
ORDER BY c.date_date DESC