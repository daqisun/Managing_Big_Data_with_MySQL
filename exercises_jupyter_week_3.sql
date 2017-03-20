/* ******************************************************************** */
/*MySQL Exercise 7: Inner Joins */
/* ******************************************************************** */

/* Question 1-4: How many unique dog_guids and user_guids are there in the reviews and dogs table independently? */
SELECT COUNT(DISTINCT dog_guid)
FROM reviews;

SELECT COUNT(DISTINCT user_guid)
FROM reviews;

SELECT COUNT(DISTINCT dog_guid)
FROM dogs;

SELECT COUNT(DISTINCT user_guid)
FROM dogs;

/* Question 5: Question 5: How would you extract the user_guid, dog_guid, breed, breed_type, and breed_group for all animals who completed the "Yawn Warm-up" game? */
SELECT c.user_guid, d.dog_guid, d.breed_type, d.breed_group
FROM dogs d, completed_tests c
WHERE d.dog_guid=c.dog_guid AND test_name='Yawn Warm-up';

/* Question 6: How would you extract the user_guid, membership_type, and dog_guid of all the golden retrievers who completed at least 1 Dognition test? */
SELECT DISTINCT d.user_guid AS UserID, u.membership_type, d.dog_guid AS DogID, d.breed, d.total_tests_completed
FROM dogs d, users u
WHERE d.user_guid=u.user_guid
AND d.breed="golden retriever"
AND d.total_tests_completed >=1;

/* Question 7: How many unique Golden Retrievers who live in North Carolina are there in the Dognition database ? */
SELECT COUNT(DISTINCT d.dog_guid)
FROM users u, dogs d
WHERE d.user_guid=u.user_guid
AND breed="Golden Retriever"
GROUP BY state
HAVING state="NC";

/* Question 8: How many unique customers within each membership type provided reviews? */
SELECT COUNT(DISTINCT u.user_guid) AS Customers, u.membership_type AS Membership
FROM reviews r, users u
WHERE r.user_guid=u.user_guid
GROUP BY membership_type

/* Question 9: For which 3 dog breeds do we have the greatest amount of site_activity data? */
SELECT d.breed, COUNT(s.script_detail_id)
FROM site_activities s, dogs d
WHERE s.dog_guid=d.dog_guid
AND s.script_detail_id IS NOT NULL
GROUP BY d.breed
ORDER BY COUNT(s.script_detail_id) DESC



/* ******************************************************************** */
/*MySQL Exercise 8: Outer Joins */
/* ******************************************************************** */

/* Question 1: How would you re-write this query using the traditional join syntax? */
SELECT d.user_guid AS UserID, d.dog_guid AS DogID, d.breed, d.breed_type, d.breed_group
FROM dogs d, complete_tests c
WHERE d.dog_guid=c.dog_guid AND test_name='Yawn Warm-up';

SELECT d.user_guid AS UserID, d.dog_guid AS DogID, d.breed, d.breed_type, d.breed_group
FROM dogs d JOIN complete_tests c
ON d.dog_guid=c.dog_guid
WHERE test_name='Yawn Warm-up';

/* Question 2: How could you retrieve this same information using a RIGHT JOIN? */
SELECT r.dog_guid AS rDogID, d.dog_guid AS dDogID, r.user_guid AS rUserID, d.user_guid AS dUserID, AVG(r.rating) AS AvgRating, COUNT(r.rating) AS NumRatings, d.breed, d.breed_group, d.breed_type
FROM reviews r LEFT JOIN dogs d
ON r.dog_guid=d.dog_guid AND r.user_guid=d.user_guid
WHERE r.dog_guid IS NOT NULL
GROUP BY r.dog_guid
HAVING NumRatings>= 10
ORDER BY AvgRating DESC;

SELECT r.dog_guid AS rDogID, d.dog_guid AS dDogID, r.user_guid AS rUserID, d.user_guid AS dUserID, AVG(r.rating) AS AvgRating, COUNT(r.rating) AS NumRatings, d.breed, d.breed_group, d.breed_type
FROM dogs d RIGHT JOIN reviews r
ON d.dog_guid=r.dog_guid AND d.user_guid=r.user_guid
WHERE r.dog_guid IS NOT NULL
GROUP BY r.dog_guid
HAVING NumRatings>= 10
ORDER BY AvgRating DESC;

/* Question 3: Question 3: How would you use a left join to retrieve a list of all the unique dogs in the dogs table, and retrieve a count of how many tests each one completed? Include the dog_guids and user_guids from the dogs and complete_tests tables in your output. */
SELECT d.dog_guid, d.user_guid, COUNT(c.created_at)
FROM dogs d LEFT JOIN complete_tests c
ON d.dog_guid=c.dog_guid
GROUP BY d.dog_guid;

/* Question 4: Repeat the query you ran in Question 3, but intentionally use the dog_guids from the completed_tests table to group your results instead of the dog_guids from the dogs table. */
SELECT d.dog_guid, d.user_guid, COUNT(c.created_at)
FROM dogs d LEFT JOIN complete_tests c
ON d.dog_guid=c.dog_guid
GROUP BY c.dog_guid;

/* Question 5: Write a query using COUNT DISTINCT to determine how many distinct dog_guids there are in the completed_tests table. */
SELECT COUNT(DISTINCT dog_guid)
FROM complete_tests;

/* Question 6: We want to extract all of the breed information of every dog a user_guid in the users table owns. If a user_guid in the users table does not own a dog, we want that information as well. Write a query that would return this information. Include the dog_guid from the dogs table, and user_guid from both the users and dogs tables in your output. */
SELECT u.user_guid, d.user_guid, d.dog_guid
FROM users u LEFT JOIN dogs d
ON u.user_guid=d.user_guid;

/* Question 7: Adapt the query you wrote above so that it counts the number of rows the join will output per user_id. Sort the results by this count in descending order. Remember that if you include dog_guid or breed fields in this query, they will be randomly populated by only one of the values associated with a user_guid. */
SELECT u.user_guid, d.user_guid, d.dog_guid
FROM users u LEFT JOIN dogs d
ON u.user_guid=d.user_guid
GROUP BY u.user_guid DESC;

/* Question 8: How many rows in the users table are associated with user_guid 'ce225842-7144-11e5-ba71-058fbc01cf0b'? */
SELECT user_guid
FROM users
WHERE user_guid="ce225842-7144-11e5-ba71-058fbc01cf0b";

/* Question 9: Examine all the rows in the dogs table that are associated with user_guid 'ce225842-7144-11e5-ba71-058fbc01cf0b'? */
SELECT user_guid
FROM dogs
WHERE user_guid="ce225842-7144-11e5-ba71-058fbc01cf0b";

/* Question 10: How would you write a query that used a left join to return the number of distinct user_guids that were in the users table, but not the dogs table. */
SELECT DISTINCT u.user_guid
FROM users u LEFT JOIN dogs d
ON u.user_guid=d.user_guid
WHERE d.user_guid IS NULL

/* Question 11: How would you write a query that used a right join to return the number of distinct user_guids that were in the users table, but not the dogs table. */
SELECT DISTINCT u.user_guid
FROM dogs d RIGHT JOIN users u
ON u.user_guid=d.user_guid
WHERE d.user_guid IS NULL

/* Question 12: Use a left join to create a list of all the unique dog_guids that are contained in the site_activities table, but not the dogs table, and how many times each one is entered. Note that there are a lot of NULL values in the dog_guid of the site_activities table, so you will want to exclude them from your list. */
SELECT s.dog_guid, COUNT(*)
FROM site_activities s LEFT JOIN dogs d
ON s.dog_guid=d.dog_guid
WHERE s.dog_guid IS NOT NULL
AND d.dog_guid IS NULL
GROUP BY s.dog_guid
