with practice_count as (
select patient_id
, count(practice_id)
from int__patients
group by all
having count(practice_id) > 1)


select *
, dense_rank() over (partition by patient_id order by registration_date desc) as rank
from int__patients
where exists (select true from practice_count
where practice_count.patient_id = int__patients.patient_id
order by patient_id, practice_id
);

