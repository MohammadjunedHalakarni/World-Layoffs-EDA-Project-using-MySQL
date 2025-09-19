World Layoffs EDA (SQL)

Project Overview

This project focuses on Exploratory Data Analysis (EDA) on a global layoffs dataset using SQL. The primary objective is to clean, process, and analyze layoffs data to extract meaningful business insights, identify trends, and summarize the patterns across companies, industries, countries, and funding stages.



Dataset

The dataset contains information about global company layoffs including:

company: Name of the company

location: Office location

industry: Industry sector

total_laid_off: Number of employees laid off

percentage_laid_off: Percentage of workforce affected

date: Layoff date

stage: Funding stage of the company

country: Country of the company

funds_raised_millions: Total funds raised in millions



Data Cleaning

The EDA project includes:

Removing duplicates – Ensuring each record is unique.

Standardizing data – Trimming spaces, fixing inconsistent industry and country names.

Handling NULL or blank values – Filling missing data or removing irrelevant records.

Fixing data types – Converting dates, numbers, and percentages to proper SQL types.



Analysis Performed

Company-level analysis – Total layoffs, average percentage laid off, and ranking companies by layoffs.

Industry-level analysis – Identifying industries with the highest layoffs.

Country-level analysis – Summarizing layoffs by country.

Time-based trends – Monthly layoffs, rolling totals, and yearly layoffs to detect patterns over time.

Top companies per year – Ranking top 5 companies with highest layoffs for each year.



SQL Techniques Used

SELECT, GROUP BY, ORDER BY for aggregation and sorting.

Window functions: ROW_NUMBER(), SUM() OVER(), DENSE_RANK() for rankings and cumulative totals.

WITH clause (CTEs) for intermediate results.

UPDATE and ALTER TABLE for data cleaning.

String functions: TRIM(), SUBSTRING(), STR_TO_DATE() for standardizing text and dates.



Insights

Identified companies with maximum layoffs and percentage affected.

Observed trends of layoffs over months and years.

Determined industries and countries most impacted by layoffs.

Highlighted top companies per year based on layoffs.



Purpose

The goal of this project is to gain actionable insights from raw layoff data using SQL, practice data cleaning and aggregation techniques, and demonstrate the ability to conduct exploratory analysis on real-world datasets.
