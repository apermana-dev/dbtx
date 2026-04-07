{{ config(materialized='table') }}
SELECT 
    P.name, 
    SUM(O.quantity) AS total_sold
FROM 
    {{ source('dbt', 'orders') }} O
    INNER JOIN {{ source('dbt', 'products') }} P ON P.product_id = O.product_id
GROUP BY 
    P.name
