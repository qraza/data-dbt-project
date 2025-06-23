select practice_name
, round(avg(age), 2) as average_age
from patient_metadata
where age > 0 and age <=100
group by all
order by practice_name
;