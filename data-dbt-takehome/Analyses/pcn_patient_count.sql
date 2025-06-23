select pcn_name as pcn
, count(patient_id) as number_of_patients
from patient_metadata
where pcn is not null
group by all
order by 2 desc
;