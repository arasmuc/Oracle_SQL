-- %D%
-- %D%  clone_user.sql  - clone already existing user
-- %D%  example:  clone_user.sql
-- %D%  author: Arkadiusz Karol Borucki
-- %D%  date: 14.10.2015
-- %D%  version 1.00

select * from dba_sys_privs where grantee=&grantee
select * from dba_role_privs where grantee=&grantee
select * from dba_tab_privs where grantee=&grantee
