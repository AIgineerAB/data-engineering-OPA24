# Exercise 2 - Streamlit dashboard

In this exercise sheet, you will work with streamlit for creating frontend dashboard.

> [!NOTE]
> These exercises covers lecture 01.

## 0. Supahcoolsoft employee executive dashboard

Create a dashboard in streamlit displaying this employee data to the executives based on supahcoolsoft.csv. Call it `Executive dashboard` for coolness sake. It should contain: 

- basic statistics on employees (total count, average age, average salary)
- show a table with employee details
- bar chart showing number of employees accross departments
- histogram of salary distribution
- box plot of salaries by department
- histogram of age distribution
- box plot of ages by department

If you want, you can try to style the dashboard using CSS, [check out this video to learn more.](https://www.youtube.com/watch?v=rkLzMLhCBiI)
Style the dashboard to make it more exclusive for executives.


## 1. PISA scores

PISA performance usually get a lot of media attention on how good it's going for the school in your country. It has gotten a lot of media attention at least in Sweden where I live. Use this [dataset of pisa performance](https://www.kaggle.com/datasets/thedevastator/pisa-performance-scores-by-country) and create a dashboard. It should contain a minimum of this: 

- basic statistics of the data (number of records, number of locations, subjects, and time periods)
- show a table with sample data
- bar chart showing average PISA scores by location
- plot trends that can be filtered for each country 
  
Bonus:
- more interactive filtering to drill down to specific locations, time period, subjects, ... 
- this filtering should be displayed on a side panel

## 2. Skolverket

Take your lab from the python course and transform it into a suitable dashboard. Put up the visualisations with some text and tables. Choose what you want to display and what could be good to filter. For example you could filter out different subjects.

## 3. Ice cream prediction app

> [!NOTE]
> This requires some basic knowledge in regression, you can for example use random forest or simply linear regression with scikit-learn

Download this [ice cream data set](https://www.kaggle.com/datasets/vinicius150987/ice-cream-revenue) and create a simple app in streamlit that lets the user enter a temperature in celsius and it outputs the revenue prediction. You can for example use random forest regression to predict the revenue.  

