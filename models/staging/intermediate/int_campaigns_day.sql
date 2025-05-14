SELECT 
    date_date,
    ROUND(SUM(ads_cost)) AS ads_cost,
    ROUND(SUM(impression)) AS impression,
    ROUND(SUM(click)) AS click
FROM {{ ref('int_campaigns') }}
GROUP BY date_date
ORDER BY date_date DESC
