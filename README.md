COVID-19 Data Analysis SQL Project
Overview
This project contains a collection of SQL queries designed to analyze COVID-19 pandemic data. The analysis explores various aspects of the pandemic including case counts, death rates, vaccination progress, and comparisons across different geographical regions.
Database Structure
The project uses a SQL Server database with two main tables:

CovidDeaths: Contains data related to COVID-19 cases and deaths
CovidVaccinations: Contains data related to COVID-19 vaccinations

Queries Included
Exploratory Analysis

Basic data exploration of cases, deaths, and population data
Time-series analysis of COVID-19 spread

Death Analysis

Case fatality rates in the United States over time
Comparison of death counts by country and continent
Global death percentages by date

Infection Analysis

Infection rates relative to population
Countries with highest infection rates
Time-series analysis of case growth

Vaccination Analysis

Vaccination progress by location
Rolling vaccination counts and percentages
Population vs. vaccination analysis

Advanced Techniques Demonstrated

Common Table Expressions (CTEs)
Temporary Tables
Window Functions
Views for visualization preparation
Data type conversion
Aggregate functions
Joins between tables

How to Use

Make sure you have SQL Server installed
Create a database named COVIDPROJ
Import the CovidDeaths and CovidVaccinations tables
Run the SQL queries in the order provided to replicate the analysis

Data Sources
The queries are designed to work with the COVID-19 dataset from Our World in Data.
Database View
The project includes the creation of a view named PercentPopulationVaccinated that can be used for visualization purposes in tools like Tableau, Power BI, or other data visualization platforms.
Notes

Some queries filter out null continent values to avoid duplication of data
Various calculation methods are demonstrated (CTEs, Temp Tables) to show different approaches
The queries can be modified to focus on specific countries or time periods based on your analysis needs
