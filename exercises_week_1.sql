/*MySQL Exercise 4: Summarizing your Data */
/* Question 1: Try combining this query with a WHERE clause to find how many individual dogs completed tests after March 1, 2014 */
SELECT COUNT(DISTINCT Dog_Guid)
FROM complete_tests
WHERE created_at>'2014_03_01';

/* Question 2: To observe the second difference yourself first, count the number of rows in the dogs table using COUNT(*) */
SELECT)COUNT(*)
FROM)dogs;

/* Question 3: Now count the number of rows in the exclude column of the dogs table */
SELECT COUNT(exclude)
FROM dogs;


/* Question 4: How many distinct dogs have an exclude flag in the dogs table (value will be "1") */
SELECT COUNT(DISTINCT dog_guid)
FROM dogs
WHERE exclude=1O;

/* Question 5: What is the average, minimum, and maximum ratings given to "Memory versus Pointing" game? */
SELECT test_name,
AVG(rating) AS AVG_Rating,
MIN(rating) AS MIN_Rating,
MAX(rating) AS MAX_Rating
FROM reviews
WHERE test_name="Memory versus Pointing";

/* Question 6: How would you query how much time it took to complete each test provided in the exam_answers table, in minutes? Title the column that represents this data "Duration." */
SELECT TIMESTAMPDIFF(minute,start_time,end_time) AS Duration
FROM exam_answers
LIMIT 200;

/* Question 7: Include a column for Dog_Guid, start_time, and end_time in your query, and examine the output */
SELECT dog_guid, start_time, end_time, TIMESTAMPDIFF(minute,start_time,end_time) AS Duration
FROM exam_answers
LIMIT 2000;

/* Question 8: What is the average amount of time it took customers to complete all of the tests in the exam_answers table, if you do not exclude any data */
SELECT Dog_Guid, start_time, end_time, AVG(TIMESTAMPDIFF(MINUTE,start_time,end_time)) AS Duration
FROM exam_answers;

/* Question 9: What is the average amount of time it took customers to complete the "Treat Warm-Up" test, according to the exam_answers table*/
SELECT Dog_Guid, start_time, end_time, AVG(TIMESTAMPDIFF(MINUTE,start_time,end_time)) AS Duration
FROM exam_answers
WHERE test_name="Treat Warm-Up"

/* Question 10: How many possible test names are there in the exam_answers table? */
SELECT COUNT(DISTINCT test_name)
FROM exam_answers;

/* Question 11: What is the minimum and maximum value in the Duration column of your query that included the data from the entire table? */
SELECT MIN(TIMESTAMPDIFF(minute,start_time,end_time)) AS MinDuration, MAX(TIMESTAMPDIFF(minute,start_time,end_time)) AS MaxDuration
FROM exam_answers;

/* Question 12: How many of these negative Duration entries are there? */
SELECT COUNT(TIMESTAMPDIFF(MINUTE,start_time,end_time))
FROM exam_answers
WHERE TIMESTAMPDIFF(MINUTE,start_time,end_time)<0;

/* Question 13: How would you query all the columns of all the rows that have negative durations so that you could examine whether they share any features that might give you clues about what caused the entry mistake? */
SELECT *
FROM exam_answers
WHERE TIMESTAMPDIFF(minute,start_time,end_time)<0;

/* Question 14: What is the average amount of time it took customers to complete all of the tests in the exam_answers table when 0 and the negative durations are excluded from your calculation */
SELECT AVG(TIMESTAMPDIFF(Minute,start_time, end_time))
FROM exam_answers
WHERE TIMESTAMPDIFF(Minute,start_time, end_time)>0;

/* ******************************************************************** */

/* MySQL Exercise 5: Summaries of Groups of Data */
/* Question 1: Output a table that calculates the number of distinct female and male dogs in each breed group of the Dogs table, sorted by the total number of dogs in descending order*/
SELECT gender, breed_group, COUNT(DISTINCT dog_guid) AS Num_Dogs
FROM dogs
GROUP BY gender, breed_group
ORDER BY Num_Dogs DESC;

/* Question 2: Revise the query your wrote in Question 1 so that it uses only numbers in the GROUP BY and ORDER BY fields*/
SELECT gender, breed_group, COUNT(DISTINCT dog_guid) AS
Num_Dogs
FROM dogs
GROUP BY 1, 2
ORDER BY 3 DESC;

/* Question 3: Revise the query your wrote in Question 2 so that it (1) excludes the NULL and empty string entries in the breed_group field, and (2) excludes any groups that don't have at least 1,000 distinct Dog_Guids in them. Your result should contain 8 rows */
SELECT gender, breed_group, COUNT(DISTINCT dog_guid) AS Num_Dogs
FROM dogs
WHERE breed_group IS NOT NULL AND breed_group!="None" AND breed_group!=""
GROUP BY 1, 2
HAVING Num_Dogs >= 1000
ORDER BY 3 DESC;

/* Question 4: Write a query that outputs the average number of tests completed and average mean inter-test-interval for every breed type, sorted by the average number of completed tests in descending order (popular hybrid should be the first row in your output) */
SELECT breed_type, AVG(total_tests_completed) AS TotTests, AVG(mean_iti_minutes)
AS AvgMeanITI
FROM dogs
GROUP BY breed_type
ORDER BY AVG(total_tests_completed) DESC;

/* Question 5: Question 5: Write a query that outputs the average amount of time (in hours) it took customers to complete each type of test where any individual reaction times over 6000 minutes are excluded and only average reaction times that are greater than 0 minutes are included */
SELECT test_name,
AVG(TIMESTAMP
DIFF(HOUR,start_time,end_time)) AS Duration
FROM exam_answers
WHERE timestampdiff(MINUTE,start_time,end_time) < 6000
GROUP BY test_name
HAVING AVG (timestampdiff(MINUTE,start_time,end_time)) > 0 ORDER BY Duration
desc

/* Question 6: Write a query that outputs the total number of unique User_Guids in each combination of State and ZIP code (postal code) in the United States, sorted first by state name in ascending alphabetical order, and second by total number of unique User_Guids in descending order*/
SELECT state, zip, COUNT(DISTINCT user_guid) AS NUM_Users
FROM users
WHERE Country="US"
GROUP BY State, zip
ORDER BY State ASC, NUM_Users DESC;

/* Question 7: Write a query that outputs the total number of unique User_Guids in each combination of State and ZIP code in the United States that have at least 5 users, sorted first by state name in ascending alphabetical order, and second by total number of unique User_Guids in descending order  */
SELECT state, zip, COUNT(DISTINCT user_guid)
AS NUM_Users
FROM users
WHERE Country="US"
GROUP BY State, zip
HAVING NUM_Users>=5
ORDER BY State ASC, NUM_Users DESC

/* ******************************************************************** */
