## COVID-19 Data Analysis SQL Project

### Project Overview

This project analyzes global COVID-19 data to identify trends and patterns across countries and continents. Using SQL, I extracted, transformed, and analyzed data from two primary datasets: COVID deaths and vaccinations. The analysis provides insights into infection rates, mortality rates, and vaccination progress worldwide. 

### Technical Details

### Data Processing

Utilized Azure Data Studio for data querying and analysis

Created a dedicated database (COVIDPROJ) for the project

Conducted comprehensive data exploration and transformation

Joined related tables using appropriate keys (location, date)

Analysis Performed

### Infection Analysis

Tracked case progression by country and date

Calculated infection rates as percentage of population

Identified countries with highest infection rates relative to population


### Mortality Analysis

Calculated death percentages (deaths/cases) by location

Analyzed death counts by country and continent

Determined regions with highest mortality rates


### Vaccination Progress

Created rolling count of vaccinations by location

Calculated percentage of population vaccinated over time

Implemented Common Table Expressions (CTEs) and temp tables for complex calculations


### Data Visualization Preparation

Created views for storing processed data

Prepared datasets for dashboard development in Tableau

Structured data to support multiple visualization perspectives

### Dashboard: 
https://public.tableau.com/app/profile/swapna.ashish.patel/viz/Sheet2_17472382162840/Dashboard1


### Technical Highlights

Advanced SQL Techniques: Window functions, CTEs, temporary tables, views, data type conversions

Data Aggregation: Utilized GROUP BY clauses with aggregate functions for meaningful summaries

Data Transformation: Implemented JOIN operations and calculated fields

Query Optimization: Created efficient queries for complex analyses

### Visualization

The project culminated in an interactive dashboard showing:

Global COVID-19 statistics (total cases, deaths, mortality rate)

Geographical distribution of infection rates

Comparative analysis of worst-affected countries

Time-series analysis of infection spread

Continental death statistics

### Business Value
This analysis provides critical insights for:

Public health officials making resource allocation decisions
Government agencies planning intervention strategies
Healthcare organizations preparing for patient surges
General public understanding pandemic progression

### Data Source
The analysis is built on the comprehensive COVID-19 dataset maintained by Our World in Data, providing a reliable foundation for epidemiological insights.
Visualization Integration
The project includes a pre-configured view named PercentPopulationVaccinated optimized for direct integration with visualization tools such as Tableau, Power BI, or Excel.

### Methodological Notes

Null continent values are filtered to prevent data duplication

Alternative calculation approaches demonstrate SQL versatility

All queries are documented for easy customization and extension
