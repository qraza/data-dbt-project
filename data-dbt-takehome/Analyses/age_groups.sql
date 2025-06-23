select
	pcn_name
,	case when age >= 0 and age <= 18 then '0 - 18'
	when age >= 19 and age <= 35 then '19 - 35'
	when age >= 36 and age <= 50 then '36 - 50'
	when age >= 51 then '51+' end as age_groups
, 	count(patient_id) as number_of_patients
from patient_metadata
where age > 0 and age <=100
group by all
order by pcn_name
       , case when age >= 0 and age <= 18 then '0 - 18'
		when age >= 19 and age <= 35 then '19 - 35'
		when age >= 36 and age <= 50 then '36 - 50'
		when age >= 51 then '51+' end
;