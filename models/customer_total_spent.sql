{{ config(materialized='table') }}
SELECT 
    C.name, 
    SUM(O.total_price) AS total_spent
FROM 
    {{ source('dbt', 'orders') }} O
    INNER JOIN {{ source('dbt', 'customers') }} C ON C.customer_id = O.customer_id
GROUP BY 
    C.name
