## Queries to Extract Data from Single Tables
### SQL Command Categories
* **Data Definition Language (DDL)**: Add / modify / delete the logical structures which contain the data or which allow users to access / mantain the data [CREATE, ALTER, DROP]
* **Data Manipulation Language (DML):** Add / modify / delete data itself [INSERT, UPDATE, DELETE]
* **Data Query Language (DQL):** Getting data from the database [SELECT, SHOW, HELP]
* **Data Control Language (DCL):** Grant / revoke permissions on databases and their contents [GRANT, REVOKE]
* **Data Transaction Language (DTL):** Manage transactions [START TRANSACTION, SAVEPOINT, COMMIT, ROLLBACK]

### Query
SQL code that describes the data you desire and the format in which you want it

|SQL Command Order|
|-----|
|SELECT columns|
|FROM database.tables|
|WHERE condition|
|GROUP (BY) this column|
|HAVING this property|
|ORDER (BY) this colmn or list;|
|LIMIT|

Processed from LIMIT to FROM

---

### SQL Queries: SHOW and DESCRIBE Command
```
SHOW tables
```
Show tables in database

```
SHOW column FROM databasename.tablename
```
Show columns of a specific table in a specific database

> **Example**
>```
> SHOW columns FROM dogs
>```
>21 rows affected
>
>| Field | Type | Null | Key | Default | Extra |
>|--------|--------------|------|-----|---------|-------|
>| gender | varchar(255) | YES |  | None |  |
>| ... | ... | ... | ... | ... |  |


```
DESCRIBE column
```
Describe column

> **Example**
>```
>DESCRIBE reviews
>```
>21 rows affected
>
>| Field | Type | Null | Key | Default | Extra |
>|--------|--------------|------|-----|---------|-------|
>| rating| int(11) | YES |  | None |  |
>| ... | ... | ... | ... | ... |  |
>| user_guid| varchar(60) | YES | MUL | None |  |
>| ... | ... | ... | ... | ... |  |

**Key column:**
* *Empty*: Not indexed or indexed only as a secondary column in a multiple-column nonunique index
* *PRI*: Primary key or one of the columns in a multiple-column primary key
* *UNI*: First column of a UNIQUE index.
* *MUL*: First column of a nonunique index in which multiple occurrences of a given value are permitted within the column

---

### SQL Queries: SELECT Command

```
SELECT column1, column2, *
FROM database.table LIMIT X OFFSET Y;
```

Show raw data of specific columns in a specific table in a specific database, * to select all columns in table, Limit rows to X starting from Y, Calculations possible

> **Example**
>```
>SELECT median_iti_minutes / 60
>FROM dogs LIMIT 5 OFFSET 10;
>```
> 10 rows affected.
>
>|median_iti_minutes / 60|
>|-----|
>|0.085555555285|
>|0.0080555537245|
>|...|

---

### SQL Queries: WHERE Command
**Interact with Numeric Data**

```
SELECT column1, column2
FROM database.table  LIMIT X OFFSET Y
WHERE condition;
```
WHERE is a pre-aggregation filter, Specifies search conditions before aggregation (logical expression)

> **Example**
>```
>SELECT user_guid, free_start_user
>FROM users
>WHERE free_start_user=1;
>```
> 16525 rows affected.
>
>|user_guid|free_start_user|
>|-----|------|
>|ce28a468-7144-11e5-ba71-058fbc01cf0b|1|
>|...|...|


**Interact with Strings**

Strings can be enclosed by
* 'Single quotation marks'
* "Double quotation marks"
* \`Backticks`

|Examples|
|--------|
|where column = 'x'|
|where column in ('x', 'y')|
|where column in ('x%')|

**Interact with Datetime Data**

Datetime Data can be
* DATE - format YYYY-MM-DD
* DATETIME - format: YYYY-MM-DD HH:MI:SS
* TIMESTAMP - format: YYYY-MM-DD HH:MI:SS
* YEAR - format YYYY or YY

---

### SQL Queries: AS Command
```
SELECT column1, column2 AS X
FROM database.table AS Y
```
AS clause allows to assign an alias (a temporary name) to a table or a column in a table, Good for: increasing the readability of queries, abbreviating long names, changing column titles in query outputs

>**Example**
>```
> SELECT start_time AS "Exam start time"
> FROM exam_answers;
>```
>|Exam start time|
>|------|
>|2013-02-05 03:58:13|
>|...|

---

### SQL Queries: DISTINCT Command
```
SELECT DISTINCT column
FROM database.table
```
DISTINCT limits output to only distinct values in column, Null values included as one category, LIMIT identifies unique values in unlimited rows

>**Example**
>```
> SELECT DISTINCT state, city
> FROM users;
>```
>|state|city|
>|------|------|
>|NJ|Boston|
>|AE|Boston|
>|PA|Birdsboro|
>|...|...|

---

### SQL Queries: ORDER BY Command
```
SELECT DISTINCT column
FROM database.table
ORDER BY column1 (1) (DESC), column2 (2) (ASC)
```
Sort rows depending on values of columns in ascending (ASC) and descending (DESC) order

>**Example**
>```
> SELECT DISTINCT user_guid, state, membership_type
>FROM users
>WHERE country="US"
>ORDER BY state ASC, membership_type ASC
>```
>|user_guid|state|membership_type|
>|------|------|--------------|
>|ce138312-7144-11e5-ba71-058fbc01cf0b|AE|1|
>|ce7587ba-7144-11e5-ba71-058fbc01cf0b|AE|1|
>|ce76f528-7144-11e5-ba71-058fbc01cf0b|AE|1|
>|...|...|...|

### SQL Queries: COUNT Function
```
SELECT COUNT(DISTINCT column,*)
FROM database.table
```
COUNT reports the number of rows in the column, * number of rows in the entire table, Null values are ignored, DISTINCT reports the number of unique values in the column

>**Example**
>```
>SELECT COUNT(breed)
>FROM dogs
>```
>1 rows affected
>
>| COUNT(breed)|
>|--------|
>| 35050|

---

### SQL Queries: SUM Function
```
SELECT SUM(column)
FROM database.table
```
SUM of rows in column, Null values are NOT ignored

>**Example**
>```
>SELECT SELECT SUM(ISNULL(exclude))
>FROM dogs
>```
>1 rows affected
>
>| SUM(ISNULL(exclude))|
>|--------|
>| 34025|

---

### SQL Queries: AVG, MIN, MAX Function
```
SELECT AVG(column),
MIN(column),
MAX(column)
FROM database.table
```
AVG Average of values in column, MIN Minimum of values in column, MAX Maximum of values in column

>**Example**
>```
>SELECT test_name,
>AVG(rating) AS AVG_Rating,
>MIN(rating) AS MIN_Rating,
>MAX(rating) AS MAX_Rating
>FROM reviews
>WHERE test_name="Eye Contact Game";
>```
>1 rows affected
>
>| test_name|AVG_Rating|MIN_Rating|MAX_Rating|
>|--------|---|---|---|
>| Eye Contact Game|2.9372|0|9|

---

### SQL Queries: GROUP BY
```
SELECT column1, column2, column3
FROM database.table
GROUP BY column1 (1), column2 (2)
```
AVG Average of values in column, MIN Minimum of values in column, MAX Maximum of values in column

>**Example**
>```
>SELECT test_name, MONTH(created_at) AS Month, COUNT(created_at) AS Num_Completed_Tests
>FROM complete_tests
>GROUP BY 1, 2
>ORDER BY 1 ASC, 2 ASC;
>```
>480 rows affected.
>
>| test_name|Month|Num_Completed_Tests|
>|--------|---|---|
>|1 vs 1 Game|1|25|
>|...|...|...|

---

### SQL Queries: HAVING
```
SELECT column1, column2, column3
FROM database.table
WHERE condition
GROUP BY column1, column2
HAVING condition
```
HAVING is a post-aggregation filter, Specifies search conditions after aggregation (logical expression)

>**Example**
>```
>SELECT test_name, MONTH(created_at) AS Month, COUNT(created_at) AS Num_Completed_Tests
>FROM complete_tests
>WHERE MONTH(created_at)=11 OR MONTH(created_at)=12
>GROUP BY 1, 2
>HAVING COUNT(created_at)>=20
>ORDER BY 3 DESC;
>```
>480 rows affected.
>
>| test_name|Month|Num_Completed_Tests|
>|--------|---|---|
>|Yawn Warm-up|11|1060|
>|...|...|...|