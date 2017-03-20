# Functions and Operators
## SQL Functions
### Aggregate Functions
* **COUNT(DISTINCT column,*)**: Count rows of rows in column, * Count of rows in entire table, Null values are ignored, DISTINCT Count of unique rows in column
* **SUM(column)**: Sum of values in column, Null values are NOT ignored
* **AVG(column)**: Average of all values in column of numeric type
* **MIN(column)**: Minimum of all values in column of numeric type
* **MAX(column)**: Maximum of all values in column of numeric type

---

## MySQL Functions


### String Functions

### Comparison Functions
* **ISNULL(column,expression)**: Returns 1 when the expression is NULL otherwise it returns 0


### Date and Time Functions**
* **TIMESTAMPDIFF(Unit, column1, column2)**: Returns a value after subtracting a datetime expression from another, Units: FRAC_SECOND (microseconds), SECOND, MINUTE, HOUR, DAY, WEEK, MONTH, QUARTER, YEAR, Returns 0 if output smaller than unit
* **MONTH(column)**: Returns month for the date within a range of 1 to 12 ( January to December)

### Operators
* **LIKE pattern**: Tests whether specific pattern can be found within a string, % Matches any number of characters including zero, _ Matches exactly one character
* **NOT LIKE pattern**: Tests whether specific pattern cannot be found within a string, % Matches any number of characters including zero, _ Matches exactly one character
* **column IS NULL**: Tests whether a value is NULL
* **column IS NOT NULL**: Tests whether a value is not NULL
