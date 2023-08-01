with 

source as (

    select * from {{ source('risktech', 'CLAIM') }}

),

renamed as (

    select
        carrier_uw_code,
        claim_id,
        claim_number,
        claim_office,
        claim_status_code,
        claim_type_code,
        date_of_claim,
        date_rptd_to_rm,
        deleted_flag,
        dttm_closed,
        dttm_paymnt_frozen,
        dttm_rcd_added,
        dttm_rcd_last_upd,
        event_id,
        event_number,
        filing_state_id,
        line_of_bus_code,
        litigated_flag,
        nf_week_wage,
        open_flag,
        paymnt_frozen_flag,
        policy_number,
        compen_status_code,
        denial_eff_date,
        recision_eff_date,
        orig_add_date,
        time_of_claim,
        datecreated,
        dateupdated,
        datapipelinerunhistoryrun_id,
        method_closed_code,
        full_denial,
        partial_denial,
        original_id,
        pmt_frz_excp_exp

    from source

)

select * from renamed
