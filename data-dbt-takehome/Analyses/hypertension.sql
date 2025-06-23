with hyper_condition as (
SELECT practice_name
, sum(case when conditions ilike '%hypertension%' then 1 else 0 end) as number_of_patients_with_hypertension
, count(patient_id) as overall_number_of_patients
from patient_metadata
group by all)

select
  practice_name
, FORMAT('{:.2f}%', percent_hypertension * 100) as percentage_patients_with_hypertension
from (
select practice_name
, number_of_patients_with_hypertension / overall_number_of_patients as percent_hypertension
from hyper_condition) as a
order by practice_name
;


