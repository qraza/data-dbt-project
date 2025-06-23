
  
  create view "data_takehome"."main"."stg__practices__dbt_tmp" as (
    with practices as (
select * from "data_takehome"."main"."raw_practices" )

select * from practices
  );
