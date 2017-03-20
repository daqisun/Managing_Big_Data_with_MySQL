# Queries to Summarize Groups of Data from Multiple Tables
## Joining Tables
### Joins
Combine rows from two or more tables

* **Inner Join**: Selects all rows from both tables as long as there is a match between the columns in both tables (Intersection of both tables)
* **Outer Join**
  * Left Outer Join: Selects all rows from the left table and matching tables on the right. Else NULL.
  * Right Outer Join: Selects all rows from the right table and matching tables on the left. Else NULL.
  * Full Outer Join: Selects all rows from both tables. Not supported by MySQL.

![ER Diagram Example](https://github.com/digadigadoo/Managing_Big_Data_with_MySQL/blob/master/images/joins_overview.png)

### Inner Joins
```
SELECT x.column1, y.column2
FROM database.table1 x, database.table2 y
WHERE x.column1=y.column2
```
"Equijoin" syntax

>Example
>
>SELECT d.user_guid AS UserID, d.dog_guid AS DogID,
d.breed, d.breed_type, d.breed_group
>FROM dogs d, complete_tests c
>WHERE d.dog_guid=c.dog_guid AND test_name='Yawn Warm-up';
>
>|UserID|DogID|breed|breed_type|breed_group|
>|----|----|----|----|----|
>|ce134e42-7144-11e5-ba71-058fbc01cf0b|fd27b272-7144-11e5-ba71-058fbc01cf0b|Labrador Retriever|Pure Breed|Sporting|
>|...|...|...|...|...|

```
SELECT x.column1, y.column2
FROM database.table1 x JOIN database.table2 y
ON x.column1=y.column2
```
"Traditional" syntax

>Example
>
>SELECT d.user_guid AS UserID, d.dog_guid AS DogID, d.breed, d.breed_type, d.breed_group
>FROM dogs d JOIN complete_tests c
>ON d.dog_guid=c.dog_guid
>WHERE test_name='Yawn Warm-up';

### Outer Joins
```
SELECT x.column1, y.column2
FROM database.table1 x LEFT JOIN database.table2 y
ON x.column1=y.column2
```
Left outer join

```
SELECT x.column1, y.column2
FROM database.table1 x RIGHT JOIN database.table2 y
ON x.column1=y.column2
```
Right outer join

```
SELECT x.column1, y.column2
FROM database.table1 x FULL OUTER JOIN database.table2 y
ON x.column1=y.column2
```
Full outer join
