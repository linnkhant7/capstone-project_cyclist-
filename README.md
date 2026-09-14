## Google Data Analytics Capstone: Cyclistic Case Study

Course: [Google Data Analytics Capstone: Complete a Case Study](https://www.coursera.org/learn/google-data-analytics-capstone)

## Introduction 

In this case study, I will take on the role of a junior data analyst at Cyclistic, a fictional bike-share company. To address the main business questions, I will follow the six stages of the data analysis process: Ask, Prepare, Process, Analyze, Share, and Act.

### Quick links:
Data Source: [divvy_tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html)

## SQL Queries

- [01. Data Combining](https://github.com/linnkhant7/capstone-project_cyclist-/blob/main/SQL/01_data_combining.sql)
- [02. Validating Data](https://github.com/linnkhant7/capstone-project_cyclist-/blob/main/SQL/02_validate_data.sql)
- [03. Data Cleaning](https://github.com/linnkhant7/capstone-project_cyclist-/blob/main/SQL/03_create_clean_table.sql)
- [04. Data Analysis](https://github.com/linnkhant7/capstone-project_cyclist-/blob/main/SQL/04_data_analysis.sql)

**Data Visualization** 
- [Power BI Dashboard](https://app.powerbi.com/groups/me/reports/80c78f87-5295-4262-b039-8246c1d59855/e9e24cfebe2393adb537?experience=power-bi)

## Background 
### Cyclistic 

Cyclistic is a bike-share company in Chicago that started in 2016. The company has more than 5,800 bikes and hundreds of docking stations across the city. Customers can choose between single-ride passes, day passes, or annual memberships.

Customers who use single-ride or day passes are called **casual riders**, while customers with annual memberships are called **members**. Cyclistic has found that annual members are more profitable, so the company wants to increase the number of people who become members.

Instead of only trying to attract new customers, Cyclistic wants to focus on casual riders who already know and use the service.

## Scenario

In this project, I am working as a junior data analyst on Cyclistic's marketing analytics team. The main goal is to understand how casual riders and annual members use Cyclistic bikes differently.

By analyzing historical trip data, I will look at things such as ride duration, days of the week, monthly trends, and overall riding patterns.

The results of this analysis will help the marketing team understand casual riders better and create strategies that could encourage them to become annual members.

The main business question for this project is:

**How do annual members and casual riders use Cyclistic bikes differently?**

## Ask

The goal of this stage is to clearly define the business task and understand what needs to be answered through the analysis.

Three questions will guide the future marketing program:

1. How do annual members and casual riders use Cyclistic bikes differently?

2. Why would casual riders buy Cyclistic annual memberships?

3. How can Cyclistic use digital media to influence casual riders to become members?

For this project, the main focus is on the first question: **How do annual members and casual riders use Cyclistic bikes differently?**

The analysis will be used to understand the differences in riding behavior between casual riders and annual members. The final report will include the business task, data sources, data cleaning steps, analysis, visualizations, key findings, and three recommendations based on the results.

## Prepare
### Data Source
For this analysis, I will use Cyclistic's historical trip data from August 2025 to July 2026. The data is publicly available through the [divvy_tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html).
The dataset can be used to analyze how casual riders and annual members use Cyclistic bikes. However, the data does not include personally identifiable information, so individual riders cannot be tracked or linked to specific purchases.

## Data Organization
The dataset contains 12 monthly files, covering the period from August 2025 through July 2026. Each file follows the naming format YYYYMM-divvy-tripdata, with one file representing one month of trip data.
Each file contains information about individual rides, including the ride ID, bike type, start and end times, start and end stations, location coordinates, and rider type. The member_casual column identifies whether each ride was taken by a casual rider or an annual member.

## Process 

BigQuery was used to combine the monthly datasets into one table and prepare the data for cleaning and analysis.
### Reason
Microsoft Excel has a worksheet limit of 1,048,576 rows, which makes it unsuitable for handling the complete Cyclistic dataset. Since the combined dataset contains more than 6 million rows, BigQuery was used because it can efficiently process and manage large volumes of data.

### Step 1 - Combining the Data
SQL Query: [Data Combining](https://github.com/linnkhant7/capstone-project_cyclist-/blob/main/SQL/01_data_combining.sql)

The 12 monthly CSV files, covering August 2025 through July 2026, were uploaded to BigQuery as separate tables. These tables were combined using UNION ALL to create a new table called all_12_months.
The combined table contains 6,037,939 rows, representing all ride records from the 12-month analysis period. This table was then used as the starting point for data validation and cleaning.

<img width="1394" height="690" alt="image" src="https://github.com/user-attachments/assets/1a7daaff-b345-472c-b9c0-292e8d502687" />

### Step 2 - Validate the 12-Month Dataset
SQL Query: [Validating Data](https://github.com/linnkhant7/capstone-project_cyclist-/blob/main/SQL/02_validate_data.sql)

I validated the combined dataset in BigQuery before cleaning it.
The validation checked for:
- total rows
- unique ride IDs
- possible duplicate ride IDs
- missing ride IDs
- missing start times
- missing end times
- missing rider types
- invalid ride times where `ended_at <= started_at`

The validation results are shown below:
<img width="1334" height="191" alt="image" src="https://github.com/user-attachments/assets/fdaa1267-a874-4a34-896a-ff194ea00e14" />

### Step 3 - Clean the 12-Month Dataset
SQL Query: [Data Cleaning](https://github.com/linnkhant7/capstone-project_cyclist-/blob/main/SQL/03_create_clean_table.sql)

I created a cleaned version of the combined dataset in BigQuery.

The cleaning process:

- removed rides where `ended_at <= started_at`
- removed duplicate ride IDs by keeping one record for each `ride_id`

The cleaned table was then used for the analysis.

### Create Month Column for analysis 

I added a new `month` column to the cleaned dataset using the `started_at` timestamp.

Each ride was assigned a three-letter month label such as `JAN`, `FEB`, `MAR`, and so on. This column was created to support monthly ride analysis.

# Step 4 - Analyze and Share 
SQL Query: [Data Analysis](https://github.com/linnkhant7/capstone-project_cyclist-/blob/main/SQL/04_data_analysis.sql)

SQL Query: Data Analysis 
Data Visualization: Power BI
The data is stored appropriately and is now prepared for analysis. I queried multiple relevant tables for the analysis and visualized them in Power BI. 
The analysis question is: How do annual members and casual riders use Cyclistic bikes differently?

I compared total rides by month, day of the week, and hour of the day to see how riding patterns differ between casual riders and annual members.


<img width="832" height="467" alt="image" src="https://github.com/user-attachments/assets/c5ad1b0d-ac3d-401e-9e5a-0a574128864a" />
<img width="829" height="200" alt="image" src="https://github.com/user-attachments/assets/45638461-ee84-4c1b-9d30-e0f52e189e5f" />

#### By Month

Annual members recorded more rides than casual riders in every month. Ride activity for both groups decreased from the fall into December and January, then gradually increased again from February through July.

The lowest ride activity occurred around December and January, while some of the highest ride volumes were seen during the warmer months, especially from May through July.

#### By Day of Week

Member rides were highest from Tuesday through Thursday, showing stronger weekday use.

Casual rides followed a different pattern. Their ride volume was lower during the middle of the week and increased toward the weekend, with Saturday having the highest number of casual rides.

The difference between members and casual riders also became much smaller on Saturday and Sunday compared with weekdays.

#### By Hour of Day

Member rides showed two noticeable peaks during the day: one around **8 AM** and a larger peak around **5 PM**.

Casual rides increased more gradually throughout the day and reached their highest level around **5 PM**.

The stronger morning and evening peaks for members may suggest that members use Cyclistic more regularly around typical commuting hours, while 
casual riders appear to have a more spread-out riding pattern during the day.

** Ride duration of the trips are compared to find the differences in the behavior of casual and member riders.**

<img width="805" height="464" alt="image" src="https://github.com/user-attachments/assets/27adaab1-a983-4302-bf75-956df06f0347" />
<img width="830" height="191" alt="image" src="https://github.com/user-attachments/assets/c5205b8e-4c24-406d-aefd-177d95094b29" />

#### By Month

Casual riders consistently had longer average rides than annual members in every month.

Casual ride duration was generally between about **17 and 24 minutes**, while member rides stayed much more consistent at around **11 to 13 minutes**.

This shows that even though members take more rides overall, casual riders tend to spend more time on each trip.

#### By Day of Week

The difference in ride duration was especially noticeable on weekends.

Casual riders had their longest average rides on **Saturday and Sunday**, at around **24–25 minutes**, while their weekday rides were shorter.

Member ride duration changed much less throughout the week and remained close to **12–14 minutes**.

This suggests that casual riders not only ride relatively more on weekends, but their weekend trips also tend to last longer.

#### By Hour of Day

Casual riders had longer average ride durations than members throughout the day.

Casual ride duration varied more by hour, while member ride duration remained relatively stable. Member rides generally stayed around **11–13 minutes**, whereas casual rides were often around **20 minutes or more**.

Overall, ride duration shows one of the clearest differences between the two groups: **casual riders take fewer rides, but their individual trips tend to be longer.**

### Summary of Findings

| Area | Annual Members | Casual Riders |
|---|---|---|
| Total rides | Higher overall ride volume | Lower overall ride volume |
| Monthly pattern | More rides every month | Follows the same seasonal pattern but at lower volume |
| Day of week | Strongest from Tuesday to Thursday | Stronger toward the weekend, especially Saturday |
| Hour of day | Clear peaks around 8 AM and 5 PM | More spread throughout the day |
| Average ride duration | Shorter and more consistent, around 11–13 minutes | Longer, usually around 17–24 minutes |
| Weekend duration | Relatively stable | Longest rides occur on weekends |

## Act

### 1. Target casual riders with weekend membership campaigns

Casual riders are most active on weekends, especially Saturday, and their weekend trips are also among their longest. Cyclistic could run weekend-focused campaigns through the app, email, and social media to promote annual membership when casual riders are most engaged.

### 2. Increase marketing and offer sign-up incentives during peak months

Casual ride volume is highest from May through July and remains strong from August through October. Cyclistic could increase marketing during these high-activity months and offer limited-time membership discounts or sign-up incentives to encourage casual riders to convert while they are actively using the service.

### 3. Use time-of-day and riding behavior for targeted promotions

Member rides show strong peaks around 8 AM and 5 PM, while casual riders have longer average trips throughout much of the day. Cyclistic could target casual riders who ride repeatedly or during regular travel times with personalized membership messages that highlight the convenience and benefits of becoming an annual member.

