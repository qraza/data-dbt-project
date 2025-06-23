with activities as (
select * from {{ ref('raw_activities') }} )

select * from activities