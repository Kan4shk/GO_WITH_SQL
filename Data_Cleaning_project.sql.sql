-- MY FIRST DATA CLEANING 

USE FIRST_LAYOFF;
SELECT *
FROM first_layoff;
DROP DATABASE first_layoff;

CREATE DATABASE LAYOFFS;

USE LAYOFFS;
SELECT * FROM LAYOFFS;

-- REMOVE DUPLICATES 
-- STANDARDIZE DATA 
-- NULL VALUES AND BLANK VALUES 
-- REMOVE ANY COLOUMN

CREATE TABLE RAW_LAYOFFS
LIKE LAYOFFS;

SELECT * FROM RAW_layoffs ;

insert into raw_layoffs
select * from layoffs;
select *
from raw_layoffs;

select *,
row_number() over( partition by company, industry, total_laid_off, percentage_laid_off, `date`) as row_num
from raw_layoffs;
 
WITH duplicate_cte AS (
  SELECT *,
         ROW_NUMBER() OVER (
           PARTITION BY company, industry, total_laid_off, percentage_laid_off, `date`, stage, location, country, funds_raised_millions
         ) AS row_num
  FROM raw_layoffs
)
SELECT *
FROM duplicate_cte
WHERE row_num > 1;

select * 
from raw_layoffs
where company = "yahoo";



 WITH duplicate_cte AS (
  SELECT *,
         ROW_NUMBER() OVER (
           PARTITION BY company, industry, total_laid_off, percentage_laid_off, `date`, stage, location, country, funds_raised_millions
         ) AS row_num
  FROM raw_layoffs
)
delete 
FROM duplicate_cte
WHERE row_num > 1;

CREATE TABLE `raw_layoffs01` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` int 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci; 



insert INTO raw_layoffs01
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, industry, total_laid_off, percentage_laid_off, `date`, stage, location, country, 
funds_raised_millions) AS row_num
  FROM raw_layoffs;
  
  SELECT * FROM RAW_LAYOFFS01
  where row_num >1 ;
  
  delete 
  FROM RAW_LAYOFFS01
  where row_num >1 ;
  
    SELECT * FROM RAW_LAYOFFS01
  where row_num >1 ;
  
  
  -- STANDARDIZING 
  
   use layoffs;
  SELECT COMPANY,(TRIM(COMPANY)) 
  FROM RAW_LAYOFFS01;
  
  update raw_layoffs01
  set company = trim(company);
  
 
select distinct industry
from raw_layoffs01
order by 1;

select * from raw_layoffs01 
where industry like "%crypto%";

update raw_layoffs01
set industry ="crypto"
where industry like "crypto%";
  
  select distinct country
from raw_layoffs01
order by 1;

select * from raw_layoffs01 
where country like "United States%";

select distinct country, trim(trailing '.' from country)
from Raw_layoffs01;

update raw_layoffs01
set country = trim(trailing '.' from country)
where country like "united states%";


select * 
from raw_layoffs01
where country like "united states%"
order by 1 ;

select `date`,
str_to_date(`date`, '%m/%d/%Y')
from raw_layoffs01
ORDER BY `date`;

update raw_LAYOFFS01
set `date` = str_to_date(`date`, '%m/%d/%Y');

select `date`
from raw_LAYOFFS01;

SELECT * FROM RAW_LAYOFFS;


-- MODIFICATION OF DATATYPE `DATE` 

ALTER TABLE RAW_LAYOFFS01
MODIFY COLUMN `date` DATE;

SELECT * FROM RAW_LAYOFFS01;


-- NULLS AND BLANKS 

SELECT * 
FROM RAW_layoffs01 
where (total_laid_off is null or percentage_laid_off is null);

SELECT * 
FROM RAW_layoffs01 
where total_laid_off is null 
and  percentage_laid_off is null;

SELECT * 
FROM RAW_layoffs01 
where industry is null 
or industry = '';

SELECT * 
FROM RAW_layoffs01 
where company = 'Airbnb';

SELECT * 
FROM raw_layoffs01 R1
JOIN raw_layoffs01 R2
 ON R1.COMPANY=R2.COMPANY
 WHERE (R1.INDUSTRY IS NULL OR R1.INDUSTRY = '')
 AND R2.INDUSTRY IS NOT NULL;
 
 SELECT R1.COMPANY,R2.COMPANY,R1.INDUSTRY, R2.INDUSTRY
FROM raw_layoffs01 R1
JOIN raw_layoffs01 R2
 ON R1.COMPANY=R2.COMPANY
 WHERE (R1.INDUSTRY IS NULL OR R1.INDUSTRY = '')
 AND R2.INDUSTRY IS NOT NULL;
 
 -- 1ST UPDATE METHOD 
 
 UPDATE raw_layoffs01 R1
JOIN raw_layoffs01 R2
ON R1.COMPANY=R2.COMPANY
SET R1.INDUSTRY=R2.INDUSTRY
WHERE (R1.INDUSTRY = '' OR R1.INDUSTRY != '')   -- CAUSE INDUSTRY COLUMN HAVE BLANK VALUES NOT NULL VALUES 
 AND R2.INDUSTRY != '';  
 
  -- 2ND UPDATE METHOD 
  
  UPDATE raw_layoffs01 R1
JOIN raw_layoffs01 R2
ON R1.COMPANY=R2.COMPANY
SET R1.INDUSTRY=R2.INDUSTRY
WHERE (R1.INDUSTRY IS NULL OR R1.INDUSTRY = '')  -- 0 CHANGES CAUSE THE COLUMN CONTAINED BLANK VALUES NOT NULL SO FIRST WE HAVE TO CONVERT BLANK INTO NULL 
 AND R2.INDUSTRY IS NOT NULL ;  
 
UPDATE raw_layoffs01
SET INDUSTRY = NULL 
WHERE INDUSTRY = ''; -- THIS IS CONVERT YOUR BLANK VALUES INTO NULL AND THEN WE WILL RUN THE QUERY  

UPDATE  raw_layoffs01 R1
JOIN raw_layoffs01 R2
 ON R1.COMPANY=R2.COMPANY
 SET R1.INDUSTRY = R2.INDUSTRY
 WHERE R1.INDUSTRY IS NULL 
 AND R2.INDUSTRY IS NOT NULL;   -- 0 CHANGES CAUSE WE HAVE ALREADY DONE IT 

SELECT * 
FROM RAW_layoffs01 
where total_laid_off is null 
and  percentage_laid_off is null;


 delete 
 FROM RAW_layoffs01 
where total_laid_off is null 
and  percentage_laid_off is null;

alter table raw_layoffs01
drop row_num; 