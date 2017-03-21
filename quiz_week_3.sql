/* 2. Given Table A (first table to be entered in the query) and Table B
(second table to be entered in the query) the query result shown below is
a result of what kind of join?  [Right Join] */

/* 3. On what day was Dillard’s income based on total sum of purchases
the greatest [04/12/18] */

SELECT TOP 10 saledate, SUM(amt) AS tot_sales
FROM trnsact
WHERE stype='P'
GROUP BY saledate
ORDER BY tot_sales DESC

/* 4. What is the deptdesc of the departments that have the top 3 greatest
numbers of skus from the skuinfo table associated with them?
[INVEST, POLOMEN, BRIOSO] */

SELECT TOP 3 COUNT(sku), deptdesc
FROM deptinfo d LEFT JOIN skuinfo s
ON d.dept=s.dept
GROUP BY deptdesc
ORDER BY COUNT(sku) DESC;

/* 5. Which table contains the most distinct sku numbers? [skuinfo] */

SELECT COUNT(DISTINCT sku)
FROM skuinfo;

SELECT COUNT(DISTINCT sku)
FROM skstinfo;

SELECT COUNT(DISTINCT sku)
FROM trnsact;

/* 6. How many skus are in the skstinfo table, but NOT in the skuinfo
table? [0] */

SELECT COUNT(DISTINCT sku), COUNT(sku)
FROM skstinfo;
SELECT COUNT(sku)
FROM skuinfo;
SELECT COUNT(st.sku)
FROM skstinfo st INNER JOIN skuinfo s
ON st.sku=s.sku
WHERE s.sku IS NULL;

/* 7. What is the average amount of profit Dillard’s made per day? [$1,527,903] */

SELECT SUM(t.amt - t.quantity*s.cost)/COUNT(DISTINCT t.saledate) AS AVGProfit
FROM trnsact t LEFT JOIN SKSTINFO s
ON t.sku = s.sku AND t.store = s.store
WHERE t.stype = 'p';

/* 8. The store_msa table provides population statistics about the geographic
location around a store. Using one query to retrieve your answer, how many
MSAs are there within the state of North Carolina (abbreviated “NC”), and
within these MSAs, what is the lowest population level (msa_pop) and
highest income level (msa_income)? [16 MSAs, lowest population of 339,511,
highest income level of $36,151] */

SELECT store, MAX(msa_income), MIN(msa_pop)
FROM store_msa
WHERE state LIKE 'NC'
GROUP BY store
ORDER BY MAX(msa_income) DESC, MIN(msa_pop) ASC

/* 9. What department (with department description), brand, style, and
color brought in the greatest total amount of sales? */


/* 10. How many stores have more than 180,000 distinct skus associated
with them in the skstinfo table? [12] */

SELECT store, COUNT(DISTINCT sku)
FROM skstinfo
GROUP BY store
HAVING COUNT(DISTINCT sku)>180000;

/* 11. Look at the data from all the distinct skus in the “cop” department
with a “federal” brand and a “rinse wash” color. You'll see that these
skus have the same values in some of the columns, meaning that they have
some features in common.

In which columns do these skus have different values from one another,
meaning that their features differ in the categories represented by the
columns? Choose all that apply. Note that you will need more than a single
correct selection to answer the question correctly. [style, size] */

SELECT *
FROM skuinfo s LEFT JOIN deptinfo d
ON s.dept=d.dept
WHERE d.deptdesc = 'COP'
AND s.brand = 'federal'
AND s.color = 'rinse wash';

/* 12. How many skus are in the skuinfo table, but NOT in the
skstinfo table? [803,966] */

SELECT COUNT(s.sku)
FROM skstinfo st RIGHT JOIN skuinfo s
ON st.sku=s.sku
WHERE st.sku IS NULL;

/* 13. In what city and state is the store that had the greatest
total sum of sales? [Metairie, LA] */

SELECT TOP 10 t.store, s.city, s.state, SUM(amt)
FROM trnsact t JOIN strinfo s
ON t.store=s.store
WHERE stype="P"
GROUP BY t.store, s.state, s.city
ORDER BY SUM(amt) DESC

/* 14. Given Table A (first table to be entered in the query) and Table
B (second table to be entered in the query) the query result shown
below is a result of what kind of join? [Left Join] */

/* 15. How many states have more than 10 Dillards stores in
them? [15] */

SELECT COUNT(*)
FROM strinfo
GROUP BY state
HAVING COUNT(*)>10;

/* 16. What is the suggested retail price of all the skus in the “reebok”
department with the “skechers” brand and a “wht/saphire” color? [$29.00] */

SELECT DISTINCT t.orgprice
FROM (skuinfo s INNER JOIN deptinfo d on s.dept=d.dept) LEFT JOIN trnsact t
ON s.sku=t.sku
WHERE d.deptdesc = 'reebok'
AND s.brand = 'skechers'
AND s.color = 'wht/saphire';
