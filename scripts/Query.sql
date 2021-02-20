select count (*)from data_analyst_jobs;
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
-- 27 postings in either TN or KY

SELECT count(title)AS posting, star_rating
FROM data_analyst_jobs
WHERE location = 'TN' and star_rating >4
GROUP BY star_rating;
-- No.4 * 3 jobs

SELECT count(title)AS posting
FROM data_analyst_jobs
WHERE review_count >=500 AND review_count <=1000;
--151 jobs

SELECT ROUND(AVG(star_rating),2)AS avg_rating, location AS state
FROM data_analyst_jobs
WHERE star_rating IS NOT NULL
GROUP BY location
ORDER BY avg_rating DESC
LIMIT 1;
--No.6 * NE is showing the highest ratings

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
-- No.9a * 40 companies

SELECT COUNT (DISTINCT company)
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

SELECT title
FROM data_analyst_jobs
WHERE lower(title) NOT LIKE '%analy%' ;

--No.12 analy is a common word for both.

SELECT domain, title, skill
FROM data_analyst_jobs
WHERE domain IS NOT null AND LOWER(skill) LIKE '%sql%' AND day_since_posting>21
;

-- 403 position that match the above criteria

SELECT domain, COUNT(title) AS Num_Pos
FROM data_analyst_jobs
WHERE domain IS NOT null AND LOWER(skill) LIKE '%sql%' AND day_since_posting>21
GROUP BY domain
ORDER BY Num_Pos DESC
LIMIT 4;

/* Internet and Software is the highest by 62 positions
Internet & Software = 62, Bank and Financial Services = 61, 
Consulting and Business Services = 57 , HealthCare = 52 */

