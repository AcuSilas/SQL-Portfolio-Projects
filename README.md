# SQL-Portfolio-Projects


### COVID-19 Data Exploration and Analysis Project

#### Overview
This project involves exploring, cleaning, integrating, and analyzing COVID-19 datasets using SQL. The goal is to derive meaningful insights and create views that can be used for building an interactive dashboard.

#### Datasets
The project uses two datasets:

CovidDeaths.csv: Contains data on COVID-19 cases and deaths.
CovidVaccinations.csv: Contains data on COVID-19 vaccinations.


#### Steps

1. Data Exploration and Cleaning
Check for Missing Values: Identify missing values in both datasets.
Convert Date Columns: Ensure date columns are in the correct DATE format.
2. Data Integration
Join Datasets: Create a unified view (CovidData) combining COVID-19 cases and deaths with vaccination data based on location and date.
3. Analysis Queries
Total Cases and Deaths by Location: Calculate the total number of cases and deaths for each location.
Vaccination Progress by Location: Determine the vaccination progress (total vaccinations, people vaccinated, people fully vaccinated) for each location.
Daily New Cases and Deaths Over Time: Analyze the daily new cases and deaths over time.
Correlation Between Vaccinations and New Cases: Explore the correlation between daily vaccinations and new cases.
4. Creating Views for Dashboard
TotalCasesDeathsByLocation: View for total cases and deaths by location.
VaccinationProgressByLocation: View for vaccination progress by location.
DailyNewCasesDeathsOverTime: View for daily new cases and deaths over time.
CorrelationVaccinationsNewCases: View for the correlation between vaccinations and new cases.

#### Conclusion

This project demonstrates how to effectively use SQL for data exploration and analysis, providing a foundation for building insightful dashboards to track and analyze COVID-19 data.
