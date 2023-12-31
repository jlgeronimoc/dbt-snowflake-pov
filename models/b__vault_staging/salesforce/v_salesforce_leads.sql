{{ config(materialized='view') }}

{%- set yaml_metadata -%}
source_model: stg_salesforce_leads
derived_columns:
  RECORD_SOURCE: "!SALESFORCE-LEADS"
  LOAD_DATETIME: "CREATED_DATETIMESTAMP"
  EFFECTIVE_FROM: "MODIFIED_DATETIMESTAMP"
  START_DATE: "MODIFIED_DATETIMESTAMP"
  END_DATE: "TO_DATE('9999-12-31')"
hashed_columns:
  LEAD_PK_HASH: "LEAD_ID"
  CONTACT_PK_HASH: "CONTACT_ID"
  LEAD_CONTACT_PK:
    - "LEAD_ID"
    - "CONTACT_ID"
  LEAD_HASHDIFF:
    is_hashdiff: true
    columns:
      - "LEAD_ID"
      - "CONTACT_ID"
      - "FIRST_NAME"
      - "LAST_NAME"
      - "COMPANY"
      - "STATUS"
      - "SOURCE"

{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ automate_dv.stage(include_source_columns=true,
                  source_model=metadata_dict['source_model'],
                  derived_columns=metadata_dict['derived_columns'],
                  null_columns=none,
                  hashed_columns=metadata_dict['hashed_columns'],
                  ranked_columns=none) }}