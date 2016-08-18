select lpad('*',level-1,'*')||owner||'.'||table_name
from(
select cons.owner, cons.table_name, rcons.owner r_owner, rcons.table_name r_table_name
from dba_constraints cons, dba_constraints rcons
where cons.r_owner=rcons.owner
and cons.r_constraint_name=rcons.constraint_name
and cons.table_name<>rcons.table_name
and rcons.owner in ('ALMAGG')
and cons.owner in ('ALMAGG')
union all
select owner, table_name, null, null
from dba_tables
where owner in ('ALMAGG'))
start with (owner, table_name) in(
select owner,table_name
from dba_tables
where owner in ('ALMAGG')
minus
select cons.owner, cons.table_name
from dba_constraints cons, dba_constraints rcons
where cons.owner in ('ALMAGG')
and cons.r_owner=rcons.owner
and cons.r_constraint_name=rcons.constraint_name
and cons.table_name<>rcons.table_name)
connect by prior owner=r_owner
and prior table_name=r_table_name;




SELECT distinct  p.table_name PARENT_TABLE, c.table_name CHILD_TABLE
FROM dba_constraints p, dba_constraints c
WHERE (p.constraint_type = 'P' OR p.constraint_type = 'U')
AND c.constraint_type = 'R'
AND p.constraint_name = c.r_constraint_name
AND p.table_name in (SELECT table_name  from all_tables where owner = 'ALMAGG')
and p.owner='ALMAGG' order by p.table_name;
