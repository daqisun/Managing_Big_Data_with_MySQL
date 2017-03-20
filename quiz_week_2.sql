# 2. Which of the following keywords are required in any query to retrieve data from a relational database? [FROM]

# 3. Which of the following database systems recognize the keyword “LIMIT” to limit the number of rows displayed from a query output? [MySQL]

# 4. Which keywords could you use to determine the names of the columns contained in a table? [DESCRIBE in MySQL and HELP in Teradata]

# 5. In how many columns of the STRINFO table of the Dillard’s database are NULL values *permitted*? [3]

DATABASE ua_dillards; 
SHOW TABLE strinfo;

# 6. In how many columns of the STRINFO table of the Dillard’s database are NULL values *present*? [3]

HELP TABLE strinfo;

SELECT TOP 10 city
FROM strinfo
WHERE city IS NULL;

SELECT TOP 10 state
FROM strinfo
WHERE state IS NULL;

SELECT TOP 10 zip
FROM strinfo
WHERE zip IS NULL;

# 7. What was the highest original price in the Dillard’s database of the item with SKU 3631365? [$17.50]

SELECT TOP 10 *
FROM trnsact WHERE SKU=3631365
ORDER BY ORGPRICE;

# 8. What is the color of the Liz Claiborne brand item with the highest SKU # in the Dillard’s database (the Liz Claiborne brand is abbreviated “LIZ CLAI” in the Dillard’s database)? [TEAK CBO]

SELECT color, sku, brand 
FROM skuinfo 
WHERE brand='LIZ CLAI'
ORDER BY SKU DESC;

# 9. What aspect of the following query will make the query crash? [There is a comma after "amt" in the first line of the query]
SELECT SKU, orgprice, sprice, amt,
FROM TRNSACT
WHERE AMT>50

# 10. What is the sku number of the item in the Dillard’s database that had the highest original sales price? [6200173]

SELECT TOP 10 sku, sprice
FROM trnsact
ORDER BY sprice DESC;

# 11. According to the strinfo table, in how many states within the United States are Dillard’s stores located? [31]

SELECT DISTINCT state
FROM strinfo;

# 12. How many Dillard’s departments start with the letter “e” [5]

Select deptdesc
FROM deptinfo
WHERE deptdesc LIKE('e%');

# 13. What was the date of the earliest sale in the database where the sale price of the item did not equal the original price of the item, and what was the largest margin (original price minus sale price) of an item sold on that earliest date? [04/08/01, $510.00]

SELECT TOP 10 saledate, (orgprice-sprice) AS margin
FROM trnsact 
WHERE orgprice > sprice OR orgprice < sprice
ORDER BY saledate ASC, margin DESC

# 14. What register number made the sale with the highest original price and highest sale price between the dates of August 1, 2004 and August 10, 2004? Make sure to sort by original price first and sale price second. [621]

SELECT TOP 10 register, saledate, orgprice, sprice 
FROM trnsact
WHERE saledate BETWEEN '2004-08-01' AND '2004-08-10'
ORDER BY orgprice DESC, sprice DESC;

# 15. Which of the following brand names with the word/letters “liz” in them exist in the Dillard’s database? Select all that apply. Note that you will need more than a single correct selection to answer the question correctly. [CIVILIZE, BELIZA]

SELECT DISTINCT brand
FROM skuinfo
WHERE brand LIKE ('%liz%');

SELECT DISTINCT brand
FROM skuinfo
WHERE brand LIKE ('liz%');

SELECT DISTINCT brand
FROM skuinfo
WHERE brand LIKE ('%liz');

# 16. What is the lowest store number of all the stores in the STORE_MSA table that are in the city of “little rock”,”memphis”, or “tulsa”? [504]

SELECT store
FROM store_msa
WHERE city IN ('little rock', 'memphis', 'tulsa')
ORDER BY store ASC; 