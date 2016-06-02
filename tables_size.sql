SELECT table_name,
          TO_CHAR(SUM(bytes)/1024/1024/1024,'9,990.00') size_gb
     FROM (SELECT segment_name table_name, bytes
            FROM dba_segments
           WHERE segment_type = 'TABLE'
             AND owner = 'ALMA'
          UNION ALL
          SELECT i.table_name, s.bytes
            FROM dba_indexes i, dba_segments s
           WHERE s.segment_name = i.index_name
             AND s.owner = i.owner
             AND s.segment_type = 'INDEX'
             AND s.owner = 'ALMA'
          UNION ALL
          SELECT l.table_name, s.bytes
            FROM dba_lobs l, dba_segments s
           WHERE s.segment_name = l.segment_name
             AND s.owner = l.owner
             AND s.segment_type = 'LOBSEGMENT'
             AND s.owner = 'ALMA'
          UNION ALL
          SELECT l.table_name, s.bytes
            FROM dba_lobs l, dba_segments s
           WHERE s.segment_name = l.index_name
             AND s.owner = l.owner
             AND s.segment_type = 'LOBINDEX'
             AND s.owner = 'ALMA')
     GROUP BY table_name
     ORDER BY 2 DESC
;
