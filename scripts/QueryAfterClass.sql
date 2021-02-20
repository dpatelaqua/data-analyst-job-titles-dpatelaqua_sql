select count (*)
from data_analyst_jobs;
/* No.1 = 1793 */

SELECT *
FROM data_analyst_jobs
LIMIT 10;
/* No.2 = Exxon Mobil */

SELECT count(title) AS posting, location
FROM data_analyst_jobs
WHERE location = 'TN'
GROUP BY location;
/* No.3 = 21  for Tennessee*/

SELECT count(title) AS postings, location
FROM data_analyst_jobs
WHERE location = 'TN' OR location='KY'
GROUP BY location;

SELECT COUNT (*)
FROM data_analyst_jobs
WHERE location IN ('TN', 'KY')

-- 27 postings in either TN or KY

SELECT count(title)AS posting, star_rating
FROM data_analyst_jobs
WHERE location = 'TN' and star_rating >4
GROUP BY star_rating;
-- No.4 * 3 jobs

--Others
SELECT COUNT(star_rating)
FROM data_analyst_jobs
WHERE location = 'TN' 
AND star_rating > 4;


SELECT count(title)AS posting
FROM data_analyst_jobs
WHERE review_count BETWEEN 500 AND 1000;
--NO 5 * 151 jobs -- Between is inclusive of the lower bound

--OTHER 
SELECT COUNT(review_count)
FROM data_analyst_jobs
WHERE review_count>=500 and review_count<=1000;


SELECT ROUND(AVG(star_rating),2)AS avg_rating, location AS state
FROM data_analyst_jobs
WHERE star_rating IS NOT NULL
GROUP BY location
ORDER BY avg_rating DESC
LIMIT 1;
--No.6 * NE is showing the highest ratings of 4.2
--OTHER good
SELECT location AS state, AVG(star_rating) AS avg_rating 
FROM data_analyst_jobs
WHERE location IS NOT null AND star_rating IS NOT null
GROUP BY state
ORDER BY avg_rating DESC; 

SELECT location as state, ROUND(AVG(star_rating), 2) as avg_stars
FROM (SELECT DISTINCT company, location, star_rating
	FROM data_analyst_jobs
	WHERE location IS NOT NULL and star_rating IS NOT NULL) sub
GROUP BY location
ORDER BY avg_stars DESC;


SELECT count(DISTINCT(title)) AS Unique_Titles
FROM data_analyst_jobs;
--No.7 * 881 positions

SELECT count(DISTINCT(title)) AS Title_Postings,location
FROM data_analyst_jobs
WHERE location = 'CA'
GROUP BY location;
--No.8 * 230 positions

SELECT company, ROUND(AVG(star_rating),2) AS avg_rating
FROM data_analyst_jobs
WHERE review_count >5000 AND company IS NOT null
GROUP BY company
ORDER BY avg_rating DESC;
-- No.9a * Shows all companies

--OTHER
SELECT company,AVG(star_rating) as avg_rating
FROM data_analyst_jobs
GROUP BY company
HAVING SUM(review_count) >= 5000
ORDER BY avg_rating DESC;

SELECT company, avg_star_rating, (SELECT COUNT(DISTINCT(company)) 
									FROM data_analyst_jobs 
									WHERE review_count >= 5000 AND company IS NOT NULL)
	FROM 
 		(SELECT company, ROUND(AVG(star_rating),2) AS avg_star_rating
		FROM data_analyst_jobs 
		WHERE review_count >= 5000 AND company IS NOT NULL
 		GROUP BY company) AS sub
	GROUP BY 1,2
	ORDER BY avg_star_rating DESC
	
SELECT DISTINCT company, ROUND(star_rating, 1) as star_rating
FROM data_analyst_jobs
WHERE review_count > 5000
	AND company IS NOT NULL
ORDER BY star_rating DESC, company;



SELECT COUNT (DISTINCT company) AS Distinct_company
FROM data_analyst_jobs
WHERE review_count >5000;
-- No - 9b 40 companies

SELECT company, ROUND(AVG(star_rating),2) AS avg_rating, count(location) AS No_locations
FROM data_analyst_jobs
WHERE review_count >5000
GROUP BY company
ORDER BY avg_rating DESC;
-- No.10 --GENERAL MOTORS, UNILEVER, MICROSOFT, NIKE, AMERICAN EX 


SELECT title
FROM data_analyst_jobs
WHERE lower(title) LIKE '%analyst%';
--No.11 1669 titles and you can replace Select statement with count(title)

--OTHER
SELECT DISTINCT title 
FROM data_analyst_jobs
WHERE title ILIKE '%Analyst%';

SELECT title, count(*) Over ()
FROM data_analyst_jobs
WHERE lower(title) LIKE '%analyst%';


SELECT COUNT(DISTINCT(title))
	FROM data_analyst_jobs
	WHERE title ILIKE '%Analyst%'
	
SELECT title, (SELECT COUNT(*) as title_count FROM data_analyst_jobs WHERE title ILIKE '%analyst%')
FROM data_analyst_jobs
WHERE title ILIKE '%analyst%';

SELECT SUM(title_count) over(),
title as job_title
From (
	SELECT Count(Distinct title) AS title_count, title 
	FROM data_analyst_jobs
	WHERE title NOT ILIKE '%analyst%' AND title NOT ILIKE '%analytics%'
	Group By title
) as sub

SELECT title
FROM data_analyst_jobs
WHERE lower(title) NOT LIKE '%analy%' ;

--No.12 analy is a common word for both and position has Tableau in common.

--Others
select distinct(title)
from data_analyst_jobs
where title not ilike '%Analyst%'
and title not ilike '%Analytics%'



SELECT domain, title, skill
FROM data_analyst_jobs
WHERE domain IS NOT null AND LOWER(skill) LIKE '%sql%' AND days_since_posting>21
;

-- 403 position that match the above criteria

SELECT domain, COUNT(title) AS Num_Pos
FROM data_analyst_jobs
WHERE domain IS NOT null AND lower(skill) LIKE '%sql%' AND days_since_posting>21
GROUP BY domain
ORDER BY Num_Pos DESC
LIMIT 4;

----OTHER

/* Internet and Software is the highest by 62 positions
Internet & Software = 62, Bank and Financial Services = 61, --
Consulting and Business Services = 57 , HealthCare = 52 */

--other

select count(title) as title_count, domain
from data_analyst_jobs
where days_since_posting > '21'
and skill ilike '%sql%'
and domain not like 'null'
group by domain
order by title_count desc


