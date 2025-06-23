with patients as (
select * from {{ ref('raw_patients') }} )

select * from patients