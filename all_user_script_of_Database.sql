set head off
set pages 0
set long 9999999
spool all_user_script_of_Database.sql
SELECT DBMS_METADATA.GET_DDL('USER', USERNAME) || '/' DDL
FROM DBA_USERS
UNION ALL
SELECT DBMS_METADATA.GET_GRANTED_DDL('ROLE_GRANT', USERNAME) || '/' DDL
FROM DBA_USERS where exists (select 'x' from dba_role_privs drp where
drp.grantee = dba_users.username)
UNION ALL
SELECT DBMS_METADATA.GET_GRANTED_DDL('SYSTEM_GRANT', USERNAME) || '/' DDL 
FROM DBA_USERS where exists (select 'x' from dba_role_privs drp where
drp.grantee = dba_users.username)
UNION ALL
SELECT DBMS_METADATA.GET_GRANTED_DDL('OBJECT_GRANT', USERNAME) || '/' DDL 
FROM DBA_USERS where exists (select 'x' from dba_tab_privs dtp where
dtp.grantee = dba_users.username);
spool off;
set heading on;
set feedback on;
set linesize 80;
exit
/

