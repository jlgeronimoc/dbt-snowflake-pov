with 

source as (

    select * from {{ source('risktech', 'claim') }}

),

renamed as (

    select

    from source

)

select * from renamed
