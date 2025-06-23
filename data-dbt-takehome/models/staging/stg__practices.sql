with practices as (
select * from {{ ref('raw_practices') }} )

select * from practices