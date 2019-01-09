   declare
   cursor a is select 'dup_'||DUPL as DUPL from tabulky_dup;
   bbb a%rowtype;
   create_t varchar(100);
   -----------------***created table***------------------------------------------------------------------
   cursor c is select 'dup_'||table_name as DUPL, t.column_name, t.DATA_TYPE, t.DATA_LENGTH from all_tab_columns t
   where t.owner = 'ERAZIM' and t.TABLE_NAME in (select * from tabulky_dup);
   ddd c%rowtype;
   alter_t varchar(100);
   -----------------***add column***--------------------------------------------------------------------
   cursor e is select 'dup_'||DUPL as DUPL from tabulky_dup;
   hhh e%rowtype;
   drop_t varchar(100);
   -----------------***drop column XXX***-------------------------------------------------------------
   --***EXECUTE part***--
   begin
   DBMS_OUTPUT.enable(100000000);
   for bbb in a loop
     create_t := 'CREATE TABLE '||bbb.dupl||' (xxx varchar(100))';
     dbms_output.put_line(create_t);
     --EXECUTE IMMEDIATE (create_t);
     end loop;
   ------------------***created table***------------------------------------------------------------------
   for ddd in c loop
     if ddd.data_type in ('DATE', 'CLOB') then alter_t := 'ALTER TABLE '||ddd.dupl||' ADD '||ddd.column_name||' '||ddd.data_type||'';
     dbms_output.put_line(alter_t); --podm¡nka, kter  odstranuje ze statmentu ç¡ýku sloupce
     else alter_t := 'ALTER TABLE '||ddd.dupl||' ADD '||ddd.column_name||' '||ddd.data_type||'('||ddd.data_LENGTH||')';
     dbms_output.put_line(alter_t);
     end if;
     --EXECUTE IMMEDIATE (alter_t);
     end loop;
   ------------------***add column***---------------------------------------------------------------------
   for hhh in e loop
     drop_t := 'ALTER TABLE '||hhh.dupl||' DROP COLUMN XXX';
     dbms_output.put_line(drop_t);
    --EXECUTE IMMEDIATE (drop_t);
     end loop;
   ------------------***drop column***---------------------------------------------------------------------
   end;
   /
