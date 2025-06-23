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
  --WHERE data IS NOT NULL
)

-- Create the final normalized table
SELECT 
  patient_id,
  practice_id,
  age,
  gender,
  registration_date,
  conditions,
  email,
  phone
FROM patients
--WHERE patient_id IS NOT NULL;