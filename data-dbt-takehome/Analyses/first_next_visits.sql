 with visit_dates as (
 SELECT
  patient_id
, activity_date
, lead(activity_date, 1) over (partition by patient_id order by activity_date) as next_visit_date
from stg__activities
where patient_id is not null
)

select
	patient_id
  , activity_date as first_activity_date
  , next_visit_date
  , date_difference
from (
select
   patient_id
 , activity_date
 , next_visit_date
 , date_diff('day', activity_date, next_visit_date) as date_difference
 , dense_rank() over (partition by patient_id order by activity_date) as rank
 from visit_dates) as a
where rank = 1
and date_difference = 90;