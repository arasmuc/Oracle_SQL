SELECT opname, target,
ROUND((sofar/totalwork),4)*100 as "Percentage_Complete", start_time,
CEIL(time_remaining/60) as "Max_Time_Remaining_In_Min",
FLOOR(elapsed_seconds/60) as  "Time_Spent_In_Min"
FROM v$session_longops 
order by start_time desc;

select * from
(SELECT opname, target,
ROUND((sofar/totalwork),4)*100 as "Percentage_Complete", start_time,
CEIL(time_remaining/60) as "Max_Time_Remaining_In_Min",
FLOOR(elapsed_seconds/60) as  "Time_Spent_In_Min"
FROM v$session_longops 
where rownum <=140;
select 

select plan_table_output from v$sql s,
table(dbms_xplan.display_cursor(s.sql_id, s.child_number, 'TYPICAL')) t
where  s.sql_id =(select distinct sql_id from v$sql where SQL_ID = &sql_id);

select * from (
select a.elapsed_time/1000000 as "et",
elapsed_time*100/(select sum(elapsed_time) from 
v$sql a left join
dba_users b on a.parsing_schema_id = b.user_id where executions>0 and a.parsing_schema_id not in (0,5)) as proc,
a.executions as ex,a.cpu_time/1000000 as "cis",
elapsed_time/executions/1000000  as "etpe",
a.cpu_time/executions/1000000 as cpe,
a.disk_reads/executions as "pr",
a.sql_id as si, b.username as un,
a.optimizer_cost as oc,
a.child_number as cn
from
v$sql a left join
dba_users b on a.parsing_schema_id = b.user_id where executions>0 and a.parsing_schema_id not in (0,5) and b.username like 'UAT_TRIB26%'
order by a.elapsed_time desc)
where ROWNUM < 200;














 
