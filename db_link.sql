SET linesize 2000 pagesize 2000
col OWNER FOR a28
col DB_LINK FOR a20
col USERNAME FOR a35
col HOST FOR a25
col CREATED FOR a32
select * from DBA_DB_LINKS;
