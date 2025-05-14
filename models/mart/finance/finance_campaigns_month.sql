WITH monthly_aggregation AS (
  SELECT
    DATE_TRUNC(date, MONTH) AS datemonth,
    ROUND(SUM(operational_margin - ads_cost), 2) AS ads_margin,
    ROUND(AVG(average_basket), 2) AS average_basket,
    ROUND(SUM(operational_margin), 2) AS operational_margin,
    ROUND(SUM(ads_cost), 2) AS ads_cost,
    SUM(ads_impression) AS ads_impression,
    SUM(ads_clicks) AS ads_clicks,
    SUM(quantity) AS quantity,
    ROUND(SUM(revenue), 2) AS revenue,
    ROUND(SUM(purchase_cost), 2) AS purchase_cost,
    ROUND(SUM(margin), 2) AS margin,
    ROUND(SUM(shipping_fee), 2) AS shipping_fee,
    ROUND(SUM(logcost), 2) AS logcost,
    ROUND(SUM(ship_cost), 2) AS ship_cost
  FROM {{ ref('finance_campaigns_day') }}
  GROUP BY 1
)

SELECT
  datemonth,
  ads_margin,
  average_basket,
  operational_margin,
  ads_cost,
  ads_impression,
  ads_clicks,
  quantity,
  revenue,
  purchase_cost,
  margin,
  shipping_fee,
  logcost,
  ship_cost
FROM monthly_aggregation
ORDER BY datemonth DESC