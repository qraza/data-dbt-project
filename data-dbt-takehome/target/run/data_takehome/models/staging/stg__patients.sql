
  
  create view "data_takehome"."main"."stg__patients__dbt_tmp" as (
    with patients as (
select * from "data_takehome"."main"."raw_patients" )

select * from patients
  );
