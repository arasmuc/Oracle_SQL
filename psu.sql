SET linesize 2000 pagesize 2000
col action_time FOR a28
col version FOR a10
col comments FOR a35
col action FOR a25
col namespace FOR a12
SELECT * FROM sys.registry$history;
