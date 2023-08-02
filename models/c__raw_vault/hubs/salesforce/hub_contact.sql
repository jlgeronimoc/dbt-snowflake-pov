
{{ config(materialized='incremental') }}

{%- set source_model = ["v_salesforce_contacts"]   -%}

{%- set src_pk = "CONTACT_PK_HASH"                -%}
{%- set src_nk = "CONTACT_ID"                -%}
{%- set src_ldts = "LOAD_DATETIME"            -%}
{%- set src_source = "RECORD_SOURCE"          -%}

{{ automate_dv.hub(src_pk=src_pk, src_nk=src_nk, src_ldts=src_ldts,
                src_source=src_source, source_model=source_model) }}