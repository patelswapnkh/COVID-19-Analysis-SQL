Use COVIDPROJ;

-- Exploring the data
Select Location, date, total_cases, new_cases, total_deaths, population
From dbo.CovidDeaths
order by 1,2;

-- Looking at Total Cases vs Total Deaths
Select Location, date, total_cases, total_deaths, Round((total_deaths/total_cases)*100 , 3) AS DeathPercent
From dbo.CovidDeaths
Where location = 'United States'
and continent is not NULL
order by 1,2;


-- Looking at Total Cases vs Population

Select Location, date, population, total_cases, (total_cases/population)*100 AS PercentageCovid
FROM dbo.CovidDeaths
--Where location = 'United States'
order by 1,2;

-- Looking at Countries with Highest Infection Rate compared to Population
Select Location, population, MAX(total_cases) as HighestInfectionCount, MAX((total_cases/population))*100 AS PercentPopulationInfected
FROM dbo.CovidDeaths
Group by Location, population
order by PercentPopulationInfected desc;

-- Showing countries with highest death count 
Select Location, MAX(cast(total_deaths as int)) as TotalDeathCount
FROM dbo.CovidDeaths
WHERE continent is not NULL
Group by Location
Order by TotalDeathCount desc;

-- Let's break the death count by continent
Select continent, MAX(cast(total_deaths as int)) as TotalDeathCount
FROM dbo.CovidDeaths
WHERE continent is not NULL
Group by continent
Order by TotalDeathCount desc;

-- Showing continents with highest death count per population
Select continent, MAX(Cast(total_deaths as int)) as HighDeathCount, Max((total_deaths/population))*100 as PercentDeath
From dbo.CovidDeaths
where continent is NOT NULL
Group by continent
Order by PercentDeath desc;

-- Global numbers by date
Select date, Sum(new_cases) as total_cases, sum(cast(new_deaths as int)) as total_deaths, sum(cast(new_deaths as int))/Sum(new_cases)*100 as DeathPercent
From dbo.CovidDeaths
Where continent is not NULL
Group by date
order by 1,2;

-- Total numbers
Select Sum(new_cases) as total_cases, sum(cast(new_deaths as int)) as total_deaths, sum(cast(new_deaths as int))/Sum(new_cases)*100 as DeathPercent
From dbo.CovidDeaths
Where continent is not NULL
--Group by date
order by 1,2;

-- Exploring the vaccination table
Select * 
from dbo.CovidVaccinations;

-- Joining the vaccination and death table


Select * 
from dbo.CovidDeaths dea 
join dbo.CovidVaccinations vac 
    on dea.location = vac.location 
    and dea.date = vac.date 

-- Looking at Total population vs Vaccination
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
sum(convert(int, vac.new_vaccinations)) OVER  (Partition by dea.location 
order by dea.location, dea.date) as RollingPeopleVaccinated
from dbo.CovidDeaths dea Join dbo.CovidVaccinations vac 
     on dea.location = vac.location
     and dea.date = vac.date 
where dea.continent is not null
order by 1,2,3

-- Calculating further using CTE

With popvsvaccinated (continent, location, date, population, new_vaccinations, RollingPeopleVaccinated)
as 
(
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
sum(convert(int, vac.new_vaccinations)) OVER  (Partition by dea.location 
order by dea.location, dea.date) as RollingPeopleVaccinated
from dbo.CovidDeaths dea Join dbo.CovidVaccinations vac 
     on dea.location = vac.location
     and dea.date = vac.date 
where dea.continent is not null
--order by 1,2,3
)
Select *, (RollingPeopleVaccinated/population)*100 as PercentRollingVaccinated
From popvsvaccinated

-- Temp Table 
Drop table if EXISTS #PercentPopulationVaccinated
Create table #PercentPopulationVaccinated
(
Continent NVARCHAR (255),
Location  NVARCHAR (255),
Date Date,
Population bigint,
New_vaccinations numeric,
RollingPeopleVaccinated numeric 
)


Insert INTO #PercentPopulationVaccinated
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
sum(convert(int, vac.new_vaccinations)) OVER  (Partition by dea.location 
order by dea.location, dea.date) as RollingPeopleVaccinated
from dbo.CovidDeaths dea Join dbo.CovidVaccinations vac 
     on dea.location = vac.location
     and dea.date = vac.date 
where dea.continent is not null
--order by 1,2,3

Select *, (RollingPeopleVaccinated/population)*100
From #PercentPopulationVaccinated

-- Creating view to store data for visualization

Create VIEW 
PercentPopulationVaccinated as 
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
sum(cast(vac.new_vaccinations) as int ) OVER  (Partition by dea.location 
order by dea.location, dea.date) as RollingPeopleVaccinated
from dbo.CovidDeaths dea Join dbo.CovidVaccinations vac 
     on dea.location = vac.location
     and dea.date = vac.date 
where dea.continent is not null
order by 1,2,3