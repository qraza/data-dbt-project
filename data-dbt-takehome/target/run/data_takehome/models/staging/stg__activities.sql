
  
  create view "data_takehome"."main"."stg__activities__dbt_tmp" as (
    with activities as (
select * from "data_takehome"."main"."raw_activities" )

select * from activities
  );
