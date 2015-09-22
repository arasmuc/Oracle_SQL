-------------------------------------------------------------------------------------------------------------------------------
-- %D%
-- %D%  info.sql - shows necessary instance- / database-information
-- %D%           
-- %D%
-- %D%  example: @info
-- %C%
-------------------------------------------------------------------------------------------------------------------------------
set linesize 160
set echo off
set verify off

column host_name format a25

select host_name, instance_name, version, startup_time, status, logins from v$instance
/
select created,log_mode, resetlogs_time, open_mode, archivelog_change# from v$database
/
select sessions_max, sessions_warning, sessions_current, sessions_highwater, users_max from v$license
/

clear columns
