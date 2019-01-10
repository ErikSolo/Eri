DECLARE
CURSOR c IS SELECT table_name,column_name,(SELECT MAX(COLUMN_ID)FROM user_tab_columns a
       WHERE a.table_name = b.table_name ) as POCET, data_type, column_id FROM user_tab_columns b
       WHERE table_name IN ('TEZBA') ORDER BY table_name,column_id;
bbb c%rowtype;
create_t varchar(234);
begin 
for bbb in c loop
create_t:= create_t||' '||bbb.column_name;
if c%rowcount=  bbb.pocet then
dbms_output.put_line('CREATE TABLE'||' '||'DUPL_'||bbb.table_name||' '||create_t);
end if;
end loop;
end;
    