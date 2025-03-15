Here are 10 essential MySQL queries that every backend developer should know:

1. **Selecting Data:**
   ```sql
   SELECT * FROM table_name;
   ```
   Retrieves all columns and rows from a table.

2. **Filtering Data:**
   ```sql
   SELECT * FROM table_name WHERE column_name = 'value';
   ```
   Retrieves rows where the specified column matches a given value.

3. **Sorting Data:**
   ```sql
   SELECT * FROM table_name ORDER BY column_name ASC;
   ```
   Retrieves rows sorted by the specified column in ascending order (use `DESC` for descending).

4. **Joining Tables:**
   ```sql
   SELECT a.column1, b.column2
   FROM table1 a
   JOIN table2 b ON a.common_column = b.common_column;
   ```
   Combines rows from two tables based on a related column.

5. **Grouping Data:**
   ```sql
   SELECT column_name, COUNT(*)
   FROM table_name
   GROUP BY column_name;
   ```
   Groups rows that have the same values in specified columns into summary rows, like counts.

6. **Using Aggregate Functions:**
   ```sql
   SELECT AVG(column_name), SUM(column_name), MAX(column_name), MIN(column_name)
   FROM table_name;
   ```
   Performs calculations on a set of values and returns a single value.

7. **Inserting Data:**
   ```sql
   INSERT INTO table_name (column1, column2)
   VALUES ('value1', 'value2');
   ```
   Adds new rows to a table.

8. **Updating Data:**
   ```sql
   UPDATE table_name
   SET column1 = 'new_value'
   WHERE column2 = 'condition';
   ```
   Modifies existing rows in a table.

9. **Deleting Data:**
   ```sql
   DELETE FROM table_name WHERE column_name = 'condition';
   ```
   Removes rows from a table.

10. **Using Subqueries:**
    ```sql
    SELECT * FROM table_name
    WHERE column_name IN (SELECT column_name FROM another_table WHERE condition);
    ```
    Uses the result of one query as a condition in another query.

These queries cover a range of operations that are commonly needed when working with databases, from basic data retrieval and manipulation to more advanced tasks like joins and subqueries.