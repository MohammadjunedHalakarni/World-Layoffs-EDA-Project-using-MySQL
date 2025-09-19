use world_layoffs;  
-- Switch to the world_layoffs database


-- View all records from the cleaned layoffs table
select * 
from layoffs_staging2;  


-- Find the maximum layoffs in numbers and percentage across all records
select max(total_laid_off), max(percentage_laid_off) 
from layoffs_staging2;  


-- Show companies that laid off 100% of employees, sorted by funds raised
select * 
from layoffs_staging2
where percentage_laid_off = 1
order by funds_raised_millions desc;  


-- Find total layoffs by company (highest first)
select company, sum(total_laid_off)
from layoffs_staging2
group by company
order by 2 desc;  


-- Find the earliest and latest dates of layoffs
select min(date),max(date)
from layoffs_staging2;  


-- Total layoffs by industry (highest first)
select industry, sum(total_laid_off)
from layoffs_staging2
group by industry
order by 2 desc;  


-- Total layoffs by country (highest first)
select country, sum(total_laid_off)
from layoffs_staging2
group by country
order by 2 desc;  


-- Yearly layoffs (total layoffs per year, most recent first)
select year(date), sum(total_laid_off)
from layoffs_staging2
group by year(date) 
order by 1 desc;  


-- Total layoffs grouped by company funding stage (e.g., Seed, Series A, IPO)
select stage, sum(total_laid_off)
from layoffs_staging2
group by stage 
order by 2 desc;  


-- Find average percentage of employees laid off per company
select company, avg(percentage_laid_off)
from layoffs_staging2
group by company
order by 2 desc;  


-- Monthly layoffs: group by Year-Month (YYYY-MM), sorted chronologically
select  substring(date,1,7) as 'Month', sum(total_laid_off) as total_off
from layoffs_staging2
where substring(date,1,7)  is not null
group by substring(date,1,7)
order by 1 asc;  


-- Rolling total layoffs: cumulative layoffs calculated month by month
with Rolling_Totals as
(
    select  substring(date,1,7) as Month, sum(total_laid_off) as total_off
    from layoffs_staging2
    where substring(date,1,7)  is not null
    group by Month
    order by 1 asc
)
select Month, total_off,
sum(total_off) over(order by Month) as rolling_total 
from Rolling_Totals;  


-- Top 5 companies with highest layoffs for each year
with Company_Year(Company, Years, total_laid_off) as
(
    select company,year(date), sum(total_laid_off)
    from layoffs_staging2
    group by company, year(date)
), 
Company_Year_Rank as
(
    select * ,
    dense_rank() over(partition by years order by total_laid_off desc) as Ranking
    from Company_Year
    where years is not null
)
select * 
from Company_Year_Rank
where Ranking <= 5;  
