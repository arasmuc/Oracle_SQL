-- %D%  OWNER                TABLE_NAME                     COLUMN_NAME                    COMMENTS
-- %D%  -------------------- ------------------------------ ------------------------------ --------------------------------------------
-- %D%  SYS                  V$SESS_IO                      CON_ID
-- %D%  SYS                  V_$SESSION                     SQL_TRANSLATION_PROFILE_ID
-- %D%  SYS                  V_$SESSION                     PGA_TUNABLE_MEM
-- %D%  SYS                  V_$SESSION                     CON_ID
-- %D%  SYS                  V_$SESSION                     EXTERNAL_NAME
-- %C%
-- %C%  YYYYMMDD  who  description - latest on top !!!
-- %C%  --------------------------------------------------------------------------------------------------------------------------------
-- %C%  
-- %C%


set linesize 160

select sess_io.sid,
       sess_io.block_gets,
       sess_io.consistent_gets,
       sess_io.physical_reads,
       sess_io.block_changes,
       sess_io.consistent_changes
  from v$sess_io sess_io, v$session sesion
 where sesion.sid = sess_io.sid
   and sesion.username is not null;
