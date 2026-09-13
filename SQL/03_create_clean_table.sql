# Step 3 - Create Clean 12 Month data 

CREATE OR REPLACE TABLE
`project-0d7d8808-0446-434b-8e9.cyclistic_project.all_12_months_CLEAN` AS

SELECT *
FROM
`project-0d7d8808-0446-434b-8e9.cyclistic_project.all_12_months`

WHERE ended_at > started_at
QUALIFY ROW_NUMBER() OVER (
PARTITION BY ride_id
ORDER BY started_at
) = 1;

# Step 4 - Create Month table in clean 12-Month data 

ALTER TABLE `project-0d7d8808-0446-434b-8e9.cyclistic_project.all_12_months_CLEAN`
ADD COLUMN month STRING;

UPDATE `project-0d7d8808-0446-434b-8e9.cyclistic_project.all_12_months_CLEAN`
SET month =
  CASE EXTRACT(MONTH FROM started_at)
    WHEN 1 THEN 'JAN'
    WHEN 2 THEN 'FEB'
    WHEN 3 THEN 'MAR'
    WHEN 4 THEN 'APR'
    WHEN 5 THEN 'MAY'
    WHEN 6 THEN 'JUN'
    WHEN 7 THEN 'JUL'
    WHEN 8 THEN 'AUG'
    WHEN 9 THEN 'SEP'
    WHEN 10 THEN 'OCT'
    WHEN 11 THEN 'NOV'
    WHEN 12 THEN 'DEC'
  END
WHERE TRUE;
