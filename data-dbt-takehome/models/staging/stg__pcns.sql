with pcns as (
select * from {{ ref('raw_pcns') }} )

select * from pcns