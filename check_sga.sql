-- %D%
-- %D%  example: @check_sga_target
-- %D%
-- %D%  New Columns in Oracle 12c in the view/tables used in this script.
-- %D%
-- %C%  YYYYMMDD  who  description - latest on top !!!
-- %C%  --------------------------------------------------------------------------------------------------------------------------------
-- %C%  20140818  DTA  show parameter _kghdsidx_count and _shared_pool_reserved_pct
-- %C%  20140804  SAJ  12c_Ready, formatted script output and header.
-- %C%  20111222  RST  show parameter SHARED_POOL
-- %C%  20110721  RST  created
-- %C%
----------------------------------------------------------------------------------------------------------------------------------------
set heading off

show parameter sga_target

show parameter DB_CACHE_SIZE
show parameter SHARED_POOL

show parameter LARGE_POOL_SIZE
show parameter JAVA_POOL_SIZE
show parameter STREAMS_POOL_SIZE
