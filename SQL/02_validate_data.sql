# Step 2 - Validate the data of all 12 months 

SELECT

  COUNT(*) AS total_rows,

  COUNT(DISTINCT ride_id) AS unique_ride_ids,

  COUNT(*) - COUNT(DISTINCT ride_id) AS possible_duplicates,

  COUNTIF(ride_id IS NULL) AS missing_ride_id,

  COUNTIF(started_at IS NULL) AS missing_started_at,

  COUNTIF(ended_at IS NULL) AS missing_ended_at,

  COUNTIF(member_casual IS NULL) AS missing_member_type,

  COUNTIF(ended_at <= started_at) AS invalid_data

FROM
`project-0d7d8808-0446-434b-8e9.cyclistic_project.all_12_months`;
