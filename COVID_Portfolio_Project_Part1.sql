
/*
Covid-19 Data Exploration and Analysis
Skills used: Joins, CTEs, Temp Tables, Window Functions, Aggregate Functions, Creating Views, Converting Data Types
*/

-- Step 1: Data Exploration and Cleaning

-- Check for missing values in CovidDeaths
SELECT * 
FROM CovidDeaths 
WHERE new_cases IS NULL 
OR new_deaths IS NULL 
OR total_cases IS NULL 
OR total_deaths IS NULL;

-- Check for missing values in CovidVaccinations
SELECT * FROM CovidVaccinations WHERE total_vaccinations IS NULL OR people_vaccinated IS NULL OR people_fully_vaccinated IS NULL OR daily_vaccinations IS NULL;

-- Convert date columns to DATE type if not already
ALTER TABLE CovidDeaths ALTER COLUMN date TYPE DATE USING (date::DATE);
ALTER TABLE CovidVaccinations ALTER COLUMN date TYPE DATE USING (date::DATE);

-- Step 2: Data Integration

-- Create a unified view combining CovidDeaths and CovidVaccinations
CREATE VIEW CovidData AS
SELECT 
    d.location,
    d.date,
    d.new_cases,
    d.new_deaths,
    d.total_cases,
    d.total_deaths,
    v.total_vaccinations,
    v.people_vaccinated,
    v.people_fully_vaccinated,
    v.daily_vaccinations
FROM 
    CovidDeaths d
JOIN 
    CovidVaccinations v
ON 
    d.location = v.location AND d.date = v.date;

-- Step 3: Analysis Queries

-- Total Cases and Deaths by Location
SELECT 
    location,
    MAX(total_cases) AS total_cases,
    MAX(total_deaths) AS total_deaths
FROM 
    CovidData
GROUP BY 
    location;

-- Vaccination Progress by Location
SELECT 
    location,
    MAX(total_vaccinations) AS total_vaccinations,
    MAX(people_vaccinated) AS people_vaccinated,
    MAX(people_fully_vaccinated) AS people_fully_vaccinated
FROM 
    CovidData
GROUP BY 
    location;

-- Daily New Cases and Deaths Over Time
SELECT 
    date,
    SUM(new_cases) AS daily_new_cases,
    SUM(new_deaths) AS daily_new_deaths
FROM 
    CovidData
GROUP BY 
    date
ORDER BY 
    date;

-- Correlation Between Vaccinations and New Cases
SELECT 
    date,
    location,
    new_cases,
    daily_vaccinations
FROM 
    CovidData
WHERE 
    daily_vaccinations IS NOT NULL
ORDER BY 
    date;

-- Step 4: Create Views for Dashboard

-- View for Total Cases and Deaths by Location
CREATE VIEW TotalCasesDeathsByLocation AS
SELECT 
    location,
    MAX(total_cases) AS total_cases,
    MAX(total_deaths) AS total_deaths
FROM 
    CovidData
GROUP BY 
    location;

-- View for Vaccination Progress by Location
CREATE VIEW VaccinationProgressByLocation AS
SELECT 
    location,
    MAX(total_vaccinations) AS total_vaccinations,
    MAX(people_vaccinated) AS people_vaccinated,
    MAX(people_fully_vaccinated) AS people_fully_vaccinated
FROM 
    CovidData
GROUP BY 
    location;

-- View for Daily New Cases and Deaths Over Time
CREATE VIEW DailyNewCasesDeathsOverTime AS
SELECT 
    date,
    SUM(new_cases) AS daily_new_cases,
    SUM(new_deaths) AS daily_new_deaths
FROM 
    CovidData
GROUP BY 
    date
ORDER BY 
    date;

-- View for Correlation Between Vaccinations and New Cases
CREATE VIEW CorrelationVaccinationsNewCases AS
SELECT 
    date,
    location,
    new_cases,
    daily_vaccinations
FROM 
    CovidData
WHERE 
    daily_vaccinations IS NOT NULL
ORDER BY 
    date;
