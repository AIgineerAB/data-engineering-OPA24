# Exercise 0 - Introduction to SQL

In this exercise, you get to familiarize yourself with SQL. For the practical exercises, you can open up your local repository as a project and make new connections to each databse file that you will work with.

> [!NOTE]
> To ingest data to the database, you should use CLI in combination with SQL script, as the relative path from dbeaver is not from the repository. Also absolute path is not recommended as this won't work for another computer.


## 0. Exploring hemnet data

Go to this [link to download hemnet data from kaggle](https://www.kaggle.com/datasets/florianlandras/stockholm-house-market-prices). Place the csv file into your local repository.

&nbsp; a) Create a database file called `hemnet.duckdb` and ingest the data from the csv file into your database.

&nbsp; b) Make a wildcard selection to checkout the data

&nbsp; c) Find out how many rows there are in the table

&nbsp; d) Describe the table that you have ingested to see the columns and data types.

&nbsp; e) Find out the 5 most expensive homes sold.

&nbsp; f) Find out the 5 cheapest homes sold.

&nbsp; g) Find out statistics on minimum, mean, median and maximum prices of homes sold.

&nbsp; h) Find out statistics on minimum, mean, median and maximum prices of price per area.

&nbsp; i) How many unique communes are represented in the dataset.

&nbsp; j) How many percentage of homes cost more than 10 million?

&nbsp; k) Feel free to explore anything else you find interesting in this dataset.

> [!Note]
> For question 1 and 2, download this [dataset on data engineering job salaries](https://www.kaggle.com/datasets/chopper53/data-engineer-salary-in-2024/data) and create a duckdb database. 

## 1. Transform salaries data

Create a new table that should contain the transformed data and call the table cleaned_salaries.

&nbsp; a) Transform employment type column based on this table

| abbreviation | meaning   |
| ------------ | --------- |
| CT           | Contract  |
| FL           | Freelance |
| PT           | Part time |
| FT           | Full time |

&nbsp; b) Do similar for company size, but you have to figure out what the abbreviations could stand for.

&nbsp; c) Make a salary column with Swedish currency for yearly salary.

&nbsp; d) Make a salary column with Swedish currency for monthly salary.

&nbsp; e) Make a salary_level column with the following categories: low, medium, high, insanely_high. Decide your thresholds for each category. Make it base on the monthly salary in SEK.

&nbsp; f) Choose the following columns to include in your table: experience_level, employment_type, job_title, salary_annual_sek, salary_monthly_sek, remote_ratio, company_size, salary_level

&nbsp; g) Think of other transformation that you want to do.

## 2. Explore your transformed table

&nbsp; a) Count number of Data engineers jobs. For simplicity just go for job_title Data Engineer.

&nbsp; b) Count number of unique job titles in total.

&nbsp; c) Find out how many jobs that goes into each salary level.

&nbsp; d) Find out the median and mean salaries for each seniority levels.

&nbsp; e) Find out the top earning job titles based on their median salaries and how much they earn.

&nbsp; f) How many percentage of the jobs are fully remote, 50 percent remote and fully not remote.

&nbsp; g) Pick out a job title of interest and figure out if company size affects the salary. Make a simple analysis as a comprehensive one requires causality investigations which are much harder to find.

&nbsp; h) Feel free to explore other things
