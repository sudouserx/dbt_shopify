{{
  config(
    materialized='table',
    unique_key='id'
  )
}}

SELECT
  a.id,
  a.updated_at,
  a.customer_id,
  a.total_price,
  c.email AS customer_email,  # Join with customers
  c.first_name,
  c.last_name
FROM {{ ref('stg_abandoned_checkouts') }} a
LEFT JOIN {{ ref('stg_customers') }} c
  ON a.customer_id = c.id