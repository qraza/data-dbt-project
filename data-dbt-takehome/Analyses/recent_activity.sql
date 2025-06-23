select
  patient_id
, max(activity_date) as most_recent_activity
from stg__activities
where patient_id is not null
group by all
order by patient_id;