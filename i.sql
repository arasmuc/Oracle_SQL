set linesize 160
set echo off
set verify off

prompt works up to 11g , for 12c we have i_12c.sql with additional columns
column host_name format a25

select host_name, instance_name, version, startup_time, status, logins from v$instance
/
select * from v$version
/
select name, platform_id, platform_name from v$database
/
select created,log_mode, resetlogs_time, open_mode, archivelog_change# from v$database
/
select sessions_max, sessions_warning, sessions_current, sessions_highwater, users_max from v$license
/


clear columns
