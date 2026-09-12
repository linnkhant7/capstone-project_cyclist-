# Step 1 - Combine all the 12 months data (August 2025 to July 2026)

CREATE OR REPLACE TABLE
`project-0d7d8808-0446-434b-8e9.cyclistic_project.all_12_months` AS

SELECT *
FROM `project-0d7d8808-0446-434b-8e9.cyclistic_project.2025 August `

UNION ALL

SELECT *
FROM `project-0d7d8808-0446-434b-8e9.cyclistic_project.2025 September `

UNION ALL

SELECT *
FROM `project-0d7d8808-0446-434b-8e9.cyclistic_project.2025 October `

UNION ALL

SELECT *
FROM `project-0d7d8808-0446-434b-8e9.cyclistic_project.2025 Nov`

UNION ALL

SELECT *
FROM `project-0d7d8808-0446-434b-8e9.cyclistic_project.2025 Dec`

UNION ALL

SELECT *
FROM `project-0d7d8808-0446-434b-8e9.cyclistic_project.2026 Jan `

UNION ALL

SELECT *
FROM `project-0d7d8808-0446-434b-8e9.cyclistic_project.2026 Feb`

UNION ALL

SELECT *
FROM `project-0d7d8808-0446-434b-8e9.cyclistic_project.2026 March`

UNION ALL

SELECT *
FROM `project-0d7d8808-0446-434b-8e9.cyclistic_project.2026 April `

UNION ALL

SELECT *
FROM `project-0d7d8808-0446-434b-8e9.cyclistic_project.2026 May `

UNION ALL

SELECT *
FROM `project-0d7d8808-0446-434b-8e9.cyclistic_project.2026 June `

UNION ALL

SELECT *
FROM `project-0d7d8808-0446-434b-8e9.cyclistic_project.2026 July`;
