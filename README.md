# Revenue cycle analytics in dbt

A dbt project on Snowflake that models synthetic healthcare claims into tested, documented revenue cycle marts and metrics: every charged dollar is traced to payments, balance transfers or what is still outstanding.

> Work in progress. All data is synthetic (Synthea).

## Layers

| Layer | Purpose | Status |
| --- | --- | --- |
| Staging | One clean, typed model per source table | Not started |
| Intermediate | Charge-line balances | Not started |
| Marts | `fct_claims`, `fct_claim_transactions`, dimensions | Not started |
| Semantic layer | Collection rate, days to close, outstanding by payer | Not started |

## Setup

1. **Snowflake.** In a Snowsight worksheet, run `snowflake/01_setup.sql`.
2. **Load data.** In Snowsight, open RAW > SYNTHEA > Stages > SYNTHEA_STAGE and upload the 8 `.csv.gz` files from `data/`. Then run `snowflake/02_create_and_load_raw.sql`.
3. **Connect dbt Cloud.** See below.

## Connect dbt Cloud

1. Generate a key pair on your computer (Mac Terminal, or Git Bash on Windows):
   ```
   openssl genrsa 2048 | openssl pkcs8 -topk8 -inform PEM -out rsa_key.p8 -nocrypt
   openssl rsa -in rsa_key.p8 -pubout -out rsa_key.pub
   ```
   Keep `rsa_key.p8` private and out of this repo.
2. Paste the contents of `rsa_key.pub` (without the BEGIN/END lines) into `snowflake/03_dbt_cloud_user.sql` and run it.
3. In dbt Cloud, create a project with a Snowflake connection: account identifier from Snowsight, role `TRANSFORMER`, warehouse `TRANSFORM_WH`, database `ANALYTICS`. For credentials, choose key pair, user `DBT_CLOUD`, and paste the private key.
4. Connect this GitHub repo, open the IDE, and run `dbt debug`.

## Data notes

- The current Synthea release writes no `ADJUSTMENT` transactions; balances move through `TRANSFERIN` and `TRANSFEROUT` instead.
- A small number of claims do not balance (charges vs. payments plus outstanding). Finding and explaining them is part of the project.
