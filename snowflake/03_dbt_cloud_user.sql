-- Step 3: a service user for dbt Cloud, signed in with a key pair instead of a password.
-- Before running: generate a key pair on your computer (see README, "Connect dbt Cloud"),
-- then paste the PUBLIC key below, without the BEGIN/END lines or line breaks.

USE ROLE ACCOUNTADMIN;

CREATE USER IF NOT EXISTS DBT_CLOUD
  TYPE = SERVICE
  DEFAULT_ROLE = TRANSFORMER
  DEFAULT_WAREHOUSE = TRANSFORM_WH
  RSA_PUBLIC_KEY = 'PASTE_YOUR_PUBLIC_KEY_HERE';

GRANT ROLE TRANSFORMER TO USER DBT_CLOUD;
