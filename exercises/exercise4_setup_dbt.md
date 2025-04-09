# Exercise 4 - Transform data with dbt

In this exercise, you will use dbt to transform data from staging to refined schemas in data warehouse. We will use dbt macros, models and tests. This exercise will help you familiarize yourself with the file structure of a dbt project and the functionalities of different types of folders/files in the project. 

> [!NOTE]
> These tasks covers lecture 06

## 0. Preparation
##### Data warehouse
Remember that dbt takes staging schemas of data warehouse as inputs. Use the original `ads.duckdb` database file provided in the lecture as the data warehouse. 

##### dbt project
Set up a new dbt project from scratch to familiarize yourself with dbt setup and configuration. Use "ads_project" as the project name. Configure your dbt project so that your models will be materialized in staging and refined schemas in the data warehouse. 


## 1. Transform data with dbt models and macros
When dlt produces tables in the staging schema in `ads.duckdb`, it produces root and nested tables. You can check out [this reference](https://dlthub.com/docs/general-usage/destination-tables) to understand the process of unnesting done by dlt. In this exercise, you will be using both root and nested tables to transform data to the refined schema. 

- create a model called `job_ads.sql` for the staging schema, which takes in the following columns in the table `staging.data_field_job_ads` and rename these columns:

| **Original Field (staging.data_field_job_ads)**  | **Renamed Field (staging.job_ads)**  | **Description**  |
|--------------------------------|------------------|----------------|
| `id`  | `job_id`  | Unique job posting identifier  |
| `headline`  | `job_title`  | Title of the job  |
| `employer__name`  | `company_name`  | Name of the employer  |
| `workplace_address__city`  | `city`  | City where the job is located  |
| `workplace_address__region`  | `region`  | Region where the job is located  |
| `employment_type__label`  | `employment_type`  | Full-time, part-time, etc. |
| `salary_type__label`  | `salary_type`  | Salary type (fixed, hourly, etc.) |
| `scope_of_work__min`  | `min_hours`  | Minimum working hours |
| `scope_of_work__max`  | `max_hours`  | Maximum working hours |
| `publication_date`  | `publication_date`  | Date job was published  |
| `application_details__email`  | `contact_email`  | Contact email for job applications |
| `application_details__reference`  | `contact_name`  | Contact person’s name |
| `application_details__other`  | `contact_phone`  | Contact phone number  |
| `description__text`  | `job_description`  | Full job description |

- apart from the columns above, include one additional column in the model, `job_ads.sql`, so that you are able to join data of the materialized model with another table called `staging.data_field_job_ads__must_have__work_experiences`
- now create another model called `job_ads_experience.sql` to create a view in the refined schema to join the column `label` of the table `staging.data_field_job_ads__must_have__work_experiences` to the previous model
- also in `job_ads_experience.sql` model, use a macro to transform all characters of the column `label` to lower case letters and name the column `required_experience`
- run these models to see if there are expected changes in the data warehouse

## 2. Test transformed data with dbt tests
Refer to [this documentation](https://docs.getdbt.com/docs/build/data-tests) to create and run relevant tests on your models defined above. When designing your tests, you need to understand the concept that data tests in dbt are ```select```statements that seek to grab "failing" records. 

- Design a few tests and carry out the tests
- What does it mean when dbt responses that a certain test is passed?

