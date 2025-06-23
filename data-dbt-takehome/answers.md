Questions / Tasks:
* Unfortunately the raw data has poor data quality. How can we handle data quality and integrity?
  * create schema.yml file and apply dbt tests, e.g. unique, not null, accepted values or relationships.
  * the schema.yml has one example of test in the int__patients model.
  * for example, there can be only unique patient_ids (refer to dup_records_patients.sql in Analyses) in the stg__patients model or practice_id cannot be null (if unknown then assign 999).
  * this can be enforced using tests that are shipped with dbt, i.e. dbt build will fail if it fails the tests.
  * custom tests can also be applied for special cases.
  * the phone number format should also be consistent (clean_phone_number.sql in Analyses)
  * the patient data had a number of additional errors e.g. age which had both negative values and values > 100 - This may be due to human error, i.e. entering the age value rather than date of birth which also ensures age is dynamic.
  * in the activities model there were negative values for duration. Use datetime fields to record start / end session and logic to calculate the duration instead of manual input.
  * use of documentation - see DAG in index.html in the target folder. 

---
* How many patients belong to each PCN?
  * see pcn_patient_count.sql in Analyses

| pcn                                | number_of_patients |
| ---------------------------------- | ------------------ |
| visualize virtual niches PCN       | 97                 |
| streamline proactive mindshare PCN | 87                 |
                          
---

* What's the average patient age per practice?
  * see average_age_by_practice.sql in Analyses (only include ages > 0 and <= 100)

 | PRACTICE_NAME                     | average_age |
| --------------------------------- | ----------- |
| Dominguez Ltd Clinic              | 43.49       |
| Foster, West and Miller Clinic    | 51.89       |
| Hayes, Walker and Williams Clinic | 50.06       |
| Invalid Practice                  | 51.11       |
| Meza-Smith Clinic                 | 42.41       |
| NULL                              | 51.88       |
---

* Categorize patients into age groups (0-18, 19-35, 36-50, 51+) and show the count per group per PCN
  * see age_groups.sql in Analyses

| PCN_NAME                           | AGE_GROUPS | Number_of_patients |
| ---------------------------------- | ---------- | ------------------ |
| streamline proactive mindshare PCN | 0 - 18     | 5                  |
| streamline proactive mindshare PCN | 19 - 35    | 19                 |
| streamline proactive mindshare PCN | 36 - 50    | 9                  |
| streamline proactive mindshare PCN | 51+        | 33                 |
| visualize virtual niches PCN       | 0 - 18     | 15                 |
| visualize virtual niches PCN       | 19 - 35    | 16                 |
| visualize virtual niches PCN       | 36 - 50    | 19                 |
| visualize virtual niches PCN       | 51+        | 24                 |
| NULL                               | 0 - 18     | 5                  |
| NULL                               | 19 - 35    | 11                 |
| NULL                               | 36 - 50    | 6                  |
| NULL                               | 51+        | 29                 |

---
* What percentage of patients have Hypertension at each practice?
  * refer to hypertension.sql in Analyses
  
| practice_name                     | percentage_patients_with_hypertension |
| --------------------------------- | ------------------------------------- |
| Dominguez Ltd Clinic              | 40.74%                                |
| Foster, West and Miller Clinic    | 38.10%                                |
| Hayes, Walker and Williams Clinic | 26.67%                                |
| Invalid Practice                  | 45.45%                                |
| Meza-Smith Clinic                 | 37.21%                                |
| NULL                              | 30.19%                                |

---
* For each patient, show their most recent activity date
  * refer to recent_activity.sql in Analyses
  * due to size the data is saved in most_recent_activity_by_patient.csv
---
* Find Patients who had no activity for 3 months after their first activity
 * first_next_visits.sql

| patient_id | first_activity_date | next_visit_date     | date_difference |
| ---------- |---------------------| ------------------- | --------------- |
| 1100001    | 2023-01-10 14:30:00 | 2023-04-10 14:30:00 | 90              |
| 1048       | 2024-04-22 12:00:00 | 2024-07-21 10:00:00 | 90              |

