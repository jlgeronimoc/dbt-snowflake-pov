WITH as_of_date AS (
    {{ dbt_utils.date_spine(datepart, start_date, end_date) }}
)

SELECT DATE_{{datepart}} as AS_OF_DATE FROM as_of_date