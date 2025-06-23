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
  FROM "data_takehome"."main"."raw_patients"

)

-- remove square brackets from conditions column
SELECT 
  patient_id,
  practice_id,
  age,
  gender,
  registration_date,
   CASE
    WHEN conditions LIKE '[%' AND conditions LIKE '%]'
    THEN substr(conditions, 2, length(conditions)-2)
    ELSE conditions
  END AS conditions,
  email,
  phone
FROM patients