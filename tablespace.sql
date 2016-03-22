-- %D%
-- %D%  tablespace.sql  - shows tablespaces with capacity
-- %D%  example:  @tablespace.sql
-- %D%  author: Arkadiusz Karol Borucki
-- %D%  date: 14.10.2015
-- %D%  query against DBA_TABLESPACE_USAGE
-- %D%

select free_percent, tablespace_name
from (
            SELECT b.tablespace_name, b.tablespace_size_mb, sum(nvl(fs.bytes,0))/1024/1024 free_size_mb,
            (sum(nvl(fs.bytes,0))/1024/1024/b.tablespace_size_mb *100) free_percent
            FROM dba_free_space fs,
                 (SELECT tablespace_name, sum(bytes)/1024/1024 tablespace_size_mb FROM dba_data_files
                  GROUP BY tablespace_name
                 ) b
           where
           fs.tablespace_name like '%'
           and
           fs.tablespace_name = b.tablespace_name
           group by b.tablespace_name, b.tablespace_size_mb
        ) ts_free_percent
WHERE free_percent < 50
ORDER BY free_percent;
