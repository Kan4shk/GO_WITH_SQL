-- exploratory data analysis

use layoffs;
select * 
from raw_layoffs01;

select *
from raw_layoffs01 
where percentage_laid_off = 1
order by  funds_raised_millions desc;

select *
from raw_layoffs01 
where COMPANY = 'AMAZON';


SELECT COMPANY, SUM(TOTAL_LAID_OFF)
FROM RAW_LAYOFFS01
GROUP BY COMPANY 
ORDER BY 2 DESC ;

select `date`
from raw_layoffs01
order by `date` ASC; 

SELECT INDUSTRY, SUM(TOTAL_LAID_OFF)
FROM RAW_LAYOFFS01
GROUP BY INDUSTRY 
ORDER BY 2 DESC ;

SELECT SUBSTRING(`DATE`,1,7) AS MONTH, SUM(TOTAL_LAID_OFF)
FROM RAW_LAYOFFS01
where  SUBSTRING(`DATE`,1,7) is not null 
GROUP BY `MONTH`
ORDER BY 1 ASC; 

with rolling_layoffs as 
(SELECT SUBSTRING(`DATE`,1,7) AS MONTH, SUM(TOTAL_LAID_OFF) as rolling_laidoffs
FROM RAW_LAYOFFS01
where  SUBSTRING(`DATE`,1,7) is not null 
GROUP BY `MONTH`
ORDER BY 1 ASC 
) 
select `month`,rolling_laidoffs, sum(rolling_laidoffs) over(order by `month`) as rolling_total
from rolling_layoffs;

SELECT COMPANY, SUM(TOTAL_LAID_OFF)
FROM RAW_LAYOFFS01
GROUP BY COMPANY 
ORDER BY 2 DESC;

SELECT COMPANY, year(`date`), SUM(TOTAL_LAID_OFF)
FROM RAW_LAYOFFS01
GROUP BY COMPANY , year(`date`)
ORDER BY 3 desc;

with company_year (company, years, total_laid_off) as
(SELECT COMPANY, year(`date`), SUM(TOTAL_LAID_OFF)
FROM RAW_LAYOFFS01
GROUP BY COMPANY , year(`date`)
) , company_year_ranking as
(
select *, 
dense_rank() over (partition by years order by total_laid_off desc) as rank_laid
from company_year
where years is not null)

select * from company_year_ranking
where rank_laid <= 5 ;







