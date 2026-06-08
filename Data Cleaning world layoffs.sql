-- Data Cleaning
 
 
 select *
 from layoffs;
 
 Create Table layoffs_staging
 like layoffs;
 
 select *
 from layoffs_staging;
 
 insert layoffs_staging
 select *
 from layoffs;
 
 
 
 
 select *,
 ROW_NUMBER() OVER( 
 partition by company , industry, location, total_laid_off, percentage_laid_off, `date`, country, funds_raised_millions) AS row_num
 from layoffs_staging;
 
 WITH duplicate_cte AS (
    select *,
 ROW_NUMBER() OVER( 
 partition by company , location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) AS row_num
 from layoffs_staging
 )
 
 SELECT *
 from duplicate_cte
 where row_num > 1;
 
 select *
 from layoffs_staging
 where company = 'Casper';
 
  select *,
 ROW_NUMBER() OVER( 
 partition by company , industry, location, total_laid_off, percentage_laid_off, `date`, country, funds_raised_millions) AS row_num
 from layoffs_staging;
 
 WITH duplicate_cte AS (
    select *,
 ROW_NUMBER() OVER( 
 partition by company , location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) AS row_num
 from layoffs_staging
 )
 
 SELECT*
 from duplicate_cte
 where row_num > 1;
 
 
 CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
   `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

 select *
 from layoffs_staging2;
 
 insert into layoffs_staging2
  select *,
 ROW_NUMBER() OVER( 
 partition by company , industry, location, total_laid_off, percentage_laid_off, `date`, country, funds_raised_millions) AS row_num
 from layoffs_staging;
 
  select *
 from layoffs_staging2
 where row_num > 1;

 delete
 from layoffs_staging2
 where row_num > 1;
  
 SELECT @@SQL_SAFE_UPDATES;
 SET SQL_SAFE_UPDATES = 0;
 
 select *
 from layoffs_staging2;
 
 -- standarzing data
 
  select company, trim(company)
 from layoffs_staging2;
 
 update layoffs_staging2
 set company = trim(company);
 
 
 select distinct industry
 from layoffs_staging2;
 
   select distinct industry
 from layoffs_staging2
 where industry like 'Crypto';
 
 update layoffs_staging2
 set industry = 'Crypto'
 where industry like 'Crypto%';
 
 
select distinct country, TRIM(TRAILING '.' FROM country)
 from layoffs_staging2
 order by 1;
 
  update layoffs_staging2
 set country = TRIM(TRAILING '.' FROM country)
 where country like 'United State%';
 
 -- changing date 
 -- select `date`,
--  STR_TO_DATE(`date`, '%m/%d/%Y')
 -- from layoffs_staging2;
 
 update layoffs_staging2
 SET `date` =  STR_TO_DATE(`date`, '%m/%d/%Y');
 
  select*
  from layoffs_staging2;
  
  -- CHNAGING THE DATA TYPE
  ALTER TABLE layoffs_staging2
  modify column `date` DATE;
  
  select *
  from layoffs_staging2;
  
  
   select *
  from layoffs_staging2
  where total_laid_off is null
  and percentage_laid_off is null;
  
    select *
  from layoffs_staging2
  where industry is null
  or industry = '';
  
    select *
  from layoffs_staging2
  where company = 'Airbnb';
  
  select t1.industry, t2.industry
  from layoffs_staging2 t1
  join layoffs_staging2 t2 
     on t1.company = t2.company
     and t1.location = t2.location
where (t1.industry is null OR T1.industry = '')
and t2.industry is not null;

update layoffs_staging2
set industry = null
where industry = '';
	
update layoffs_staging2 t1
join layoffs_staging2 t2 
     on t1.company = t2.company
SET t1.industry = t2.industry
where t1.industry is null
and t2.industry is not null;

 select *
  from layoffs_staging2
  where total_laid_off is null
  and percentage_laid_off is null;
  
  delete
  from layoffs_staging2
  where total_laid_off is null
  and percentage_laid_off is null;
  
  alter TABLE layoffs_staging2
  DROP column row_num;
  
  