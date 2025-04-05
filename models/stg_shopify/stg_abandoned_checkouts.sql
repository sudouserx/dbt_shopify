{{
  config(
    materialized='view',
    unique_key='id'
  )
}}

SELECT
  id,
  updated_at,
  -- Extract customer_id from the JSONB field
  (customer->>'id')::BIGINT AS customer_id,  -- Cast to match customers.id type
  -- Include other fields as needed
  total_price,
  billing_address
FROM {{ source('public', 'abandoned_checkouts') }}  # Airbyte's raw table