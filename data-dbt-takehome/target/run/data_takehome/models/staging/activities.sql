
  
  create view "data_takehome"."main"."activities__dbt_tmp" as (
    with activities as (
select * from "data_takehome"."main"."raw_activities" )

select * from activities
  );
