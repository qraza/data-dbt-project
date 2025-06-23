
  
  create view "data_takehome"."main"."activities_from_seed__dbt_tmp" as (
    with activities as (
select * from "data_takehome"."main"."raw_activities" )

select * from activities
  );
