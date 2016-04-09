-- %D%   -  displays details of a user.
-- %D%
-- %D%  parameter 1 - username
-- %D%
-- %D%  example: @suser.sql bmw_system
-- %D%
-- %D%  New Columns in Oracle 12c in the view/tables used in this script.
-- %D%
-- %D%  OWNER                TABLE_NAME                     COLUMN_NAME                    COMMENTS
-- %D%  -------------------- ------------------------------ ------------------------------ ----------------------------------------------------------------------
-- %D%  SYS                  DBA_USERS                      PROXY_ONLY_CONNECT             Whether this user can connect only through a proxy
-- %D%  SYS                  DBA_USERS                      COMMON                         Indicates whether this user is Common
-- %D%  SYS                  DBA_USERS                      LAST_LOGIN
-- %D%  SYS                  DBA_USERS                      ORACLE_MAINTAINED              Denotes whether the user was created, and is maintained, by Oracle-sup
-- %D%                                                                                     plied scripts. A user for which this has the value Y must not be chang
-- %D%                                                                                     ed in any way except by running an Oracle-supplied script.
-- %C%
-- %C%  YYYYMMDD  who  description - latest on top !!!
-- %C%  -----------------------------------------------------------------------------------------------------------------------
-- %C%  20140728  NMS  12c_Ready, formatted script output and header.
-- %C%  20031030  PNO  initial version
-- %C%
-------------------------------------------------------------------------------------------------------------------------------
set linesize 160
set verify off
column username format a30
column cdat       heading "Created"        format a14
column ldat       heading "Locked"         format a14
column acs        heading "Account Status" format a20
column default_ts heading "Default TS"     format a20 truncate
column profile    heading "Profile"        format a15

prompt .
prompt . please enter parameter 1 as username ...
prompt .

select username,
       to_char(created,'dd.mm.yy hh24:mi') cdat,
       default_tablespace default_tS,
       profile,
       to_char(lock_date,'dd.mm.yy hh24:mi') ldat,
       substr(account_status,1,20) acs
  from dba_users
 where username like upper('&1')
 order by username;
