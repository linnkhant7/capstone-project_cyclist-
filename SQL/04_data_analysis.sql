-- no. of trips per month

SELECT 
  member_casual,
  month,
  CASE month
    WHEN 'AUG' THEN 1
    WHEN 'SEP' THEN 2
    WHEN 'OCT' THEN 3
    WHEN 'NOV' THEN 4
    WHEN 'DEC' THEN 5
    WHEN 'JAN' THEN 6
    WHEN 'FEB' THEN 7
    WHEN 'MAR' THEN 8
    WHEN 'APR' THEN 9
    WHEN 'MAY' THEN 10
    WHEN 'JUN' THEN 11
    WHEN 'JUL' THEN 12
  END AS month_number,
  COUNT(*) AS total_trips
FROM `project-0d7d8808-0446-434b-8e9.cyclistic_project.all_12_months_CLEAN`
GROUP BY member_casual, month
ORDER BY month_number;

-- no. of trips per day of week

SELECT 
member_casual,
`day_of_the_week `,
CASE `day_of_the_week `
    WHEN 'Sunday' THEN 1 
    WHEN 'Monday' THEN 2
    WHEN 'Tuesday' THEN 3
    WHEN 'Wednesday' THEN 4
    WHEN 'Thursday' THEN 5
    WHEN 'Friday' THEN 6
    WHEN 'Saturday' THEN 7 
  END AS day_number,
COUNT (*) As Total_trips 
FROM `project-0d7d8808-0446-434b-8e9.cyclistic_project.all_12_months_CLEAN`
GROUP BY 
`day_of_the_week `,
member_casual;

-- no. of trips per hour

SELECT
 LTRIM(FORMAT_TIMESTAMP('%I %p', started_at), '0') AS start_hour,
 EXTRACT(HOUR FROM started_at) AS start_houroftheday,
 member_casual,
 COUNT (*) AS Total_trips 
FROM `project-0d7d8808-0446-434b-8e9.cyclistic_project.all_12_months_CLEAN`
GROUP BY 
member_casual,
start_houroftheday,
start_hour
ORDER BY
  start_houroftheday,
  member_casual;

-- average ride_length per month

SELECT 
member_casual,
ROUND(
    AVG(TIMESTAMP_DIFF(ended_at, started_at, SECOND)) / 60.0,
    2
  ) AS avg_ride_minutes,
  month,
  CASE month
    WHEN 'AUG' THEN 1
    WHEN 'SEP' THEN 2
    WHEN 'OCT' THEN 3
    WHEN 'NOV' THEN 4
    WHEN 'DEC' THEN 5
    WHEN 'JAN' THEN 6
    WHEN 'FEB' THEN 7
    WHEN 'MAR' THEN 8
    WHEN 'APR' THEN 9
    WHEN 'MAY' THEN 10
    WHEN 'JUN' THEN 11
    WHEN 'JUL' THEN 12
  END AS month_number
FROM `project-0d7d8808-0446-434b-8e9.cyclistic_project.all_12_months_CLEAN`
GROUP BY 
member_casual, 
month;

-- average ride_length per day of week

SELECT 
member_casual,
`day_of_the_week `,
  CASE `day_of_the_week `
    WHEN 'Sunday' THEN 1 
    WHEN 'Monday' THEN 2
    WHEN 'Tuesday' THEN 3
    WHEN 'Wednesday' THEN 4
    WHEN 'Thursday' THEN 5
    WHEN 'Friday' THEN 6
    WHEN 'Saturday' THEN 7 
  END AS day_number,
ROUND 
(
  AVG(TIMESTAMP_DIFF(ended_at,started_at,SECOND))/60,2
) AS Averge_ride 
FROM `project-0d7d8808-0446-434b-8e9.cyclistic_project.all_12_months_CLEAN`
GROUP BY 
member_casual,
`day_of_the_week `;


-- average ride_length per hour

SELECT
member_casual,
LTRIM(FORMAT_TIMESTAMP('%I %p', started_at), '0') AS start_hour,
 EXTRACT(HOUR FROM started_at) AS start_houroftheday,
 ROUND(
    AVG(TIMESTAMP_DIFF(ended_at, started_at, SECOND)) / 60.0,
    2
  ) AS avg_ride_minutes
FROM `project-0d7d8808-0446-434b-8e9.cyclistic_project.all_12_months_CLEAN`
GROUP BY member_casual, start_houroftheday, start_hour
ORDER BY
  start_houroftheday,
  member_casual;
