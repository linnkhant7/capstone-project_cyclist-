## Google Data Analytics Capstone: Cyclistic Case Study

Course: [Google Data Analytics Capstone: Complete a Case Study](https://www.coursera.org/learn/google-data-analytics-capstone)

## Introduction 

In this case study, I will take on the role of a junior data analyst at Cyclistic, a fictional bike-share company. To address the main business questions, I will follow the six stages of the data analysis process: Ask, Prepare, Process, Analyze, Share, and Act.

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
For this analysis, I will use Cyclistic's historical trip data from August 2025 to July 2026. The data is publicly available through the [divvy_tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html) and is provided by Motivate International Inc.
The dataset can be used to analyze how casual riders and annual members use Cyclistic bikes. However, the data does not include personally identifiable information, so individual riders cannot be tracked or linked to specific purchases.

## Data Organization
The dataset contains 12 monthly files, covering the period from August 2025 through July 2026. Each file follows the naming format YYYYMM-divvy-tripdata, with one file representing one month of trip data.
Each file contains information about individual rides, including the ride ID, bike type, start and end times, start and end stations, location coordinates, and rider type. The member_casual column identifies whether each ride was taken by a casual rider or an annual member.

## Process 

BigQuery was used to combine the monthly datasets into one table and prepare the data for cleaning and analysis.
### Reason
Microsoft Excel has a worksheet limit of 1,048,576 rows, which makes it unsuitable for handling the complete Cyclistic dataset. Since the combined dataset contains more than 6 million rows, BigQuery was used because it can efficiently process and manage large volumes of data.

### Step 1 - Combining the Data
The 12 monthly CSV files, covering August 2025 through July 2026, were uploaded to BigQuery as separate tables. These tables were combined using UNION ALL to create a new table called all_12_months.
The combined table contains 6,037,939 rows, representing all ride records from the 12-month analysis period. This table was then used as the starting point for data validation and cleaning.

<img width="1394" height="690" alt="image" src="https://github.com/user-attachments/assets/1a7daaff-b345-472c-b9c0-292e8d502687" />

### Step 2 - Validate the 12-Month Dataset

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

I created a cleaned version of the combined dataset in BigQuery.

The cleaning process:

- removed rides where `ended_at <= started_at`
- removed duplicate ride IDs by keeping one record for each `ride_id`

The cleaned table was then used for the analysis.

### Create Month Column for analysis 

I added a new `month` column to the cleaned dataset using the `started_at` timestamp.

Each ride was assigned a three-letter month label such as `JAN`, `FEB`, `MAR`, and so on. This column was created to support monthly ride analysis.

# Step 4 - Analyze and Share 

SQL Query: Data Analysis 
Data Visualization: Power BI
The data is stored appropriately and is now prepared for analysis. I queried multiple relevant tables for the analysis and visualized them in Power BI. 
The analysis question is: How do annual members and casual riders use Cyclistic bikes differently?











