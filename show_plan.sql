-- %D%
-- %D%  show_plan.sql  - shows execution plan for a single query. Sql_id must be declared
-- %D%  example:  show_plan.sql  -   remember sql_id must be in single bracket:  'SQL_ID'
-- %D%  Enter value for sql_id: '3zchpm3g045uc'
-- %D%  author: Arkadiusz Karol Borucki
-- %D%  date: 14.10.2015
-- %D%  version 1.00

select plan_table_output from v$sql s,
table(dbms_xplan.display_cursor(s.sql_id, s.child_number, 'TYPICAL')) t
where  s.sql_id =(select distinct sql_id from v$sql where SQL_ID = &sql_id);
