# Exercise 3 - Loading API data with dlt

In this exercise, you will work with loading API data with dlt into duckdb databases. You will also experience looking through documentation of data sources and python libraries to produce codes for your purposes.

> [!NOTE]
> These exercises covers lecture 04-05

## 0. Preparation
We will be working with raw data from Open Stockholm and Open Weather Map APIs. Both APIs require API key for accessing data. Therefore, before working with tasks below, you need to obtain API keys for both data sources and understand how to work with these secrets securely. 

##### API key for weather data
Create an account at [Open Weather Map homepage](https://openweathermap.org/) and obtain API key under your account. 

##### API key for Stockholm parking data
Obtain an API key from [this link](https://openstreetgs.stockholm.se/Home/Key) from Stockholm city- Open Stockholm homepage. 

##### Working with secrets
When making a GET request to both APIs, you need to provide the API endpoint (URL) together with the API keys for authentication. However, you should not expose your API keys in your python scripts. Instead, you can make use of `.env` file. Make sure that this file IS NOT TRACKED by git. Check out [this reference](https://www.geeksforgeeks.org/how-to-create-and-use-env-files-in-python/) to understand how to use `.env` file to work with secrets.


## 1. Load weather data to duckdb

- in [Open Weather Data Documentation](https://openweathermap.org/current#name), find out the relevant endpoint for making API request by city name and using Celsius as the unit of measurement for temperature
- use python to send multiple get requests to get weather data for Stockholm, London, Paris, New York and Tokyo
- use dlt to create a `weather.duckdb` database and append weather data for each city to a table called `weather_by_city` in schema `staging`. This table should have the following columns:
  - city: the corresponding city
  - timestamp: the time when you send the requests
  - temperature: access value for the key "temp" in the json data
  - humidity: access value for the key "humidity" in the json data
  - pressure: access value for the key "pressure" in the json data
  - weather_description: access value for the key "description" in the json data
  - wind_speed: access value for the key "speed" in the json data
  - cloudiness: access value for the key "all" in the json data

- use `duckdb`library in python to check if the data are loaded as expected. You should use connext manager to connect to the db. You can refer to [duckdb documentation](https://duckdb.org/docs/stable/clients/python/overview.html) for these

## 2. Load parking data to duckdb
- check [this page](https://openparking.stockholm.se/LTF-Tolken/v1/ptillaten/help/operations/GetForeskrifterByWeekday) to find the endpoint for getting data for "måndag"
- use dlt to create a database called `stockholm_parking.duckdb`, load data to a schema called `staging` and a table called `parking_addresses`
- in the table, create columns for the information below. Can you find out which keys should be used in the raw json data to access these information?
  - timestamp
  - address
  - city district
  - parking price
- use `duckdb`library in python to check if the data are loaded as expected. Follow the duckdb documentation in task 1

## 3. Explore use of `secrets.toml`
With dlt, there is an alternative way to set up secrets, which is the use of `secrets.toml`
- look at the documentation of dlt [here](https://dlthub.com/docs/general-usage/credentials/setup#secretstoml-and-configtoml) to understand how to set up this file and access the secrets stored in this file by your main pipeline script
- replace the use of `.env` file in question 1 and 2 with `secrets.toml`
- make sure that the secrets are not tracked by git and the pipeline can be run as before with the new set up of secrets
