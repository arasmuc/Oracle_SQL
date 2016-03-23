# child or parent tables on a table

 1) Query to find the child tables

SELECT p.table_name PARENT_TABLE, c.table_name CHILD_TABLE
FROM dba_constraints p, dba_constraints c
WHERE (p.constraint_type = 'P' OR p.constraint_type = 'U')
AND c.constraint_type = 'R'
AND p.constraint_name = c.r_constraint_name
AND p.table_name = UPPER('&PARENT_TABLE_NAME')
and p.owner='&PARENT_TABLE_SCHEMA';

2) Query to find the parent tables of a table

SELECT c.table_name CHILD_TABLE, p.table_name PARENT_TABLE,c.owner CHILD_TABLE_OWNER,p.owner PARENT_TABLE_OWNER
FROM dba_constraints p, dba_constraints c
WHERE (p.constraint_type = 'P' OR p.constraint_type = 'U')
AND c.constraint_type = 'R'
AND p.constraint_name = c.r_constraint_name
AND c.table_name = UPPER('&CHILD_TABLE_NAME')
and c.owner='&CHILE_TABLE_SCHEMA'; --This condition is required in case you have multiple tables with same name

eg:
SELECT distinct  p.table_name PARENT_TABLE, c.table_name CHILD_TABLE
FROM dba_constraints p, dba_constraints c
WHERE (p.constraint_type = 'P' OR p.constraint_type = 'U')
AND c.constraint_type = 'R'
AND p.constraint_name = c.r_constraint_name
AND p.table_name in (SELECT table_name  from all_tables where owner = 'ALMAGG')
and p.owner='ALMAGG' order by p.table_name;
