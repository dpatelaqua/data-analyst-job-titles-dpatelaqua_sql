/*select count (*)from data_analyst_jobs;*/
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
WHERE location = 'TN' and star_rating >=4
GROUP BY star_rating;
-- 4 jobs

SELECT count(title)AS posting
FROM data_analyst_jobs
WHERE review_count >=500 AND review_count <=1000;
--151 jobs

SELECT ROUND(AVG(star_rating),2) AS avg_rating, location AS state
FROM data_analyst_jobs
GROUP BY location
ORDER BY avg_rating DESC;
--No.6 is NE is showing the highest ratings