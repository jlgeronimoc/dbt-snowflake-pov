
{{ config(materialized='incremental') }}

{%- set yaml_metadata -%}
source_model: "v_risktech_claims"
src_pk: "CLAIM_HK"
src_hashdiff: 
  source_column: "CLAIM_HASHDIFF"
  alias: "HASHDIFF"
src_payload:
  - "carrier_uw_code"
  - "claim_number"
  - "claim_office"
  - "claim_status_code"
  - "claim_type_code"
  - "date_of_claim"
  - "date_rptd_to_rm"
src_eff: "EFFECTIVE_FROM"
src_ldts: "LOAD_DATETIME"
src_source: "RECORD_SOURCE"
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ automate_dv.sat(src_pk=metadata_dict["src_pk"],
                   src_hashdiff=metadata_dict["src_hashdiff"],
                   src_payload=metadata_dict["src_payload"],
                   src_eff=metadata_dict["src_eff"],
                   src_ldts=metadata_dict["src_ldts"],
                   src_source=metadata_dict["src_source"],
                   source_model=metadata_dict["source_model"])   }}