
  
  create view "data_takehome"."main"."stg__pcns__dbt_tmp" as (
    with pcns as (
select * from "data_takehome"."main"."raw_pcns" )

select * from pcns
  );
