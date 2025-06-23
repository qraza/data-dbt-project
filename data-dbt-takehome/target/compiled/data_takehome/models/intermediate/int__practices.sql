with pcns as (
select *
FROM "data_takehome"."main"."stg__pcns"
)

, practices as (
select *
FROM "data_takehome"."main"."stg__practices"
)


select
     practices.id
   , practices.practice_name
   , practices.location
   , practices.established_date
   , practices.pcn
   , pcn_name
  from practices
  left join pcns
  on pcns.id = practices.pcn