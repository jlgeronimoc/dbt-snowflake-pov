
{{ config(materialized='incremental') }}

{%- set yaml_metadata -%}
source_model: "v_salesforce_contacts"
src_pk: "CONTACT_PK_HASH"
src_hashdiff: 
  source_column: "CONTACT_HASHDIFF"
  alias: "HASHDIFF"
src_payload:
    - "CONTACTID"
    - "FIRST_NAME"
    - "LAST_NAME"
    - "EMAIL"
    - "COUNTRY"
src_eff: "MODIFIEDDATE"
src_ldts: "DATECREATED"
src_source: "RECORD_SOURCE"
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ dbtvault.sat(src_pk=metadata_dict["src_pk"],
                src_hashdiff=metadata_dict["src_hashdiff"],
                src_payload=metadata_dict["src_payload"],
                src_eff=metadata_dict["src_eff"],
                src_ldts=metadata_dict["src_ldts"],
                src_source=metadata_dict["src_source"],
                source_model=metadata_dict["source_model"])   }}