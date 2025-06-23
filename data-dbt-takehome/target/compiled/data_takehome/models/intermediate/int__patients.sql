WITH patients AS (
  SELECT 
    json_extract_string(data, '$.patient_id') AS patient_id,
    json_extract_string(data, '$.practice_id') AS practice_id,
    json_extract_string(data, '$.age') AS age,
    json_extract_string(data, '$.gender') AS gender,
    json_extract_string(data, '$.registration_date') AS registration_date,
    json_extract_string(data, '$.conditions') AS conditions,
    json_extract_string(data, '$.contact.email') AS email,
    json_extract_string(data, '$.contact.phone') AS phone
  FROM "data_takehome"."main"."stg__patients"
)

, clean_patients as (
-- remove square brackets from conditions column and clean phone number
SELECT 
  patient_id,
  case when practice_id = 'invalid' then '999'
       when practice_id IS NULL then '0' ELSE practice_id END AS practice_id,
  age,
  gender,
  registration_date,
  replace(CASE
    WHEN conditions LIKE '[%' AND conditions LIKE '%]'
    THEN substr(conditions, 2, length(conditions)-2)
    ELSE conditions
  END, '"', '') as conditions,
  email,
      regexp_replace(
        -- Step 2: Handle leading 1 or 001
        CASE
            WHEN regexp_matches(regexp_replace(phone, '[^0-9]', '', 'g'), '^(1|001)')
            THEN regexp_replace(regexp_replace(phone, '[^0-9]', '', 'g'), '^(1|001)', '')
            -- Step 3: Preserve numbers before letters, remove after
            ELSE regexp_replace(
                regexp_replace(phone, '([0-9]+)[a-zA-Z].*', '\1'),
                '[^0-9]', '', 'g'
            )
        END,
        -- Final cleanup in case any special chars remain
        '[^0-9]', '', 'g'
    ) AS phone
FROM patients)

select
     patient_id
   , CAST(practice_id AS INT) AS practice_id
   , CAST(nullif(age, 'unknown') AS INT) AS age
   , gender
   , registration_date
   , conditions
   , email
   , phone
from (
select *
 , dense_rank() over (partition by patient_id order by registration_date desc) as rank
from clean_patients) as a
where rank = 1