{{
  config(
    materialized='view',
    unique_key='id'
  )
}}

SELECT
  id,
  email,
  first_name,
  last_name,
  updated_at
FROM {{ source('public', 'customers') }}