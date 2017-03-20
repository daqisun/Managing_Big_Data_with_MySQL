# Understanding Relational Databases
## Characteristics of a Good Data Storage
* Easy retrieval
* Easy updating
* Accessibility for multiple people at the same time
* Data consistency 
* Space efficient
* Speed
* Security

## Relational Databases
### Definition 
This model organizes data into one or more tables ("relations") of columns and rows, with a unique key identifying each row ("records", "tuples"). Generally, each table/relation represents one "entity type" (such as customer). The rows represent instances of that type of entity and the columns representing values attributed to that instance.

* Tables are the smallest logical subsets of data
* Each column represents a unique category of information
* Each row must be unique
* Order of columns or rows doesn't matter


## Database Design Tools
### Entity-Relationship Diagrams (ER Diagrams)
Shows how data in database are supposed to be connected or related

![ER Diagram Example](https://github.com/digadigadoo/Managing_Big_Data_with_MySQL/blob/master/images/er_diagram_example.png)

**Symbols and Meaning:** 

1. Entity:
	* Object or concept about which data is stored (table)
	* Entity Instance: Single occurance of entity type (row)
	* *Weak entity*: Entity that cannot be uniquely identified by its attributed and must use foreign key in conjunction with its attributes to create primary key

2. Attribute:
	* Properties of entities, Columns
	* *Key Attribute*: Unique value in each entity instance, Collumns that allow to link tables
	* *Partial Key Attribute*: A Key from a related entity type must be used in conjunction with the attribute in question to uniquely identify instances of a corresponding entity set
	* *Composite Attribute*: An attribute is considered composite if it comprises two or more other attributes
	* *Multivalued Attribute*: There can be many values associated with the attribute at any one point in time
	* *Derived Attribute*: Value of attribute can be derived from values of other attributes

3. Relationships:
	* Connection between entities
	* *Cardinality notations* define the attributes of the relationship between the entities

![Symbols](https://github.com/digadigadoo/Managing_Big_Data_with_MySQL/blob/master/images/er_diagram_symbols.png)

###  Relational Schemas
**Critical Components:**
* Tables
* Primary keys (bold, underlined)
	* Columns/set of columns whose value is unique for every row in a table
	* Only one column per table (unless multiple columns are needed to identify each row)
	* Cannot have null values

![Primary key](https://github.com/digadigadoo/Managing_Big_Data_with_MySQL/blob/master/images/primary_key.png)

* Unique Columns (U)
	* Columns/set of columns whose value is unique for every row in a table (underlined)
	* Can contain null values 

![Unique column](https://github.com/digadigadoo/Managing_Big_Data_with_MySQL/blob/master/images/unique_column.png)

* Foreign keys (FK)
	* Allow information in different tables to be linked to each other
	* Refer to columns with unique values for every row in other relations/tables

![Unique column](https://github.com/digadigadoo/Managing_Big_Data_with_MySQL/blob/master/images/foreign_key.png)
	

**Vocabulary:**

Practical Term | Technical Term
------------ | -------------
Table | Relation
Column  | Attribute
*No order* | *No order*
Row | Tuple
*Can be duplicated* | *Cannot be duplicated*
*No order* | *No order*