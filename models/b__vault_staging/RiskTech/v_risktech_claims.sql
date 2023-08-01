{{ config(materialized='view') }}

{%- set yaml_metadata -%}
source_model: stg_risktech__CLAIM
derived_columns:
  RECORD_SOURCE: "!RISKTECH_CLAIM"
  LOAD_DATETIME: "datecreated"
  EFFECTIVE_FROM: "dateupdated"
  START_DATE: "dateupdated"
  END_DATE: "TO_DATE('9999-12-31')"
hashed_columns:
  CLAIM_HK: "claim_id"
  CLAIM_HASHDIFF:
    is_hashdiff: true
    columns:
      - "claim_office"
      - "event_id"
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ automate_dv.stage(include_source_columns=true,
                source_model=metadata_dict['source_model'],
                derived_columns=metadata_dict['derived_columns'],
                null_columns=none,
                hashed_columns=metadata_dict['hashed_columns'],
                ranked_columns=none) }}
