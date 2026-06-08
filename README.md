# SQL Data Cleaning Project

## Project Overview
This project focuses on cleaning and standardizing a layoffs dataset using MySQL.  
The goal was to prepare raw data for analysis by removing duplicates, fixing blank values, standardizing text fields, and handling missing data.

To protect the original dataset, I first created a duplicate/staging table. This allowed me to perform all cleaning steps on the copied table while keeping the original raw data unchanged.

## Tools Used
- MySQL
- MySQL Workbench
- SQL

## Cleaning Steps
- Created a duplicate/staging table to preserve the original dataset
- Removed duplicate rows
- Trimmed white spaces from company names
- Standardized text fields such as industry names
- Converted blank values to NULL where needed
- Filled missing industry values using matching company and location data
- Checked and handled null values
- Prepared the dataset for analysis

## SQL Skills Used
- CREATE TABLE
- INSERT INTO
- SELECT statements
- UPDATE statements
- DELETE statements
- JOINs
- Self joins
- WHERE conditions
- GROUP BY
- HAVING
- TRIM()
- NULL handling

## Files
- `layoffs_data_cleaning.sql` — contains the SQL queries used for cleaning the dataset.

## What I Learned
Through this project, I practiced using SQL to clean real-world data while following good data cleaning practices. One important step was creating a duplicate table first, so the original raw data remained safe and unchanged during the cleaning process.

Before cleaning, I created a duplicate/staging table so that all changes were made on a copied version of the data while preserving the original raw dataset.
