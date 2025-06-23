
  
    
    

    create  table
      "data_takehome"."main"."patient_metadata__dbt_tmp"
  
    as (
      with patients as (
select *
 FROM "data_takehome"."main"."int__patients"
)

, practices as (
select *
 FROM "data_takehome"."main"."int__practices"
)

select
      patient_id
    , practice_id
    , practices.practice_name
    , practices.location
    , pcn_name
    , age
    , gender
    , registration_date
    , conditions
FROM patients
LEFT JOIN practices
ON patients.practice_id = practices.id
    );
  
  