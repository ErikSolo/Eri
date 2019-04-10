DECLARE
TYPE num_t IS TABLE OF number index by binary_integer;
     l_count_t num_t;
TYPE tab_t IS TABLE OF VARCHAR2(35);
tableList tab_t := tab_t(
    'DITE',
    'ZENA',
    'SETT_DUP'
   -- add more tables here
);

table_nam   VARCHAR2(34);
l_count     NUMBER;

PROCEDURE gen_insert (p_tab_name VARCHAR2, p_exist BOOLEAN default false)
IS
  v_column_list     VARCHAR2(4096) := null;
  v_insert_list     VARCHAR2(16096);
  v_ref_cur_columns VARCHAR2(16096) := null;
  v_ref_cur_query   VARCHAR2(16000);
  v_ref_cur_output  VARCHAR2(16000) := null;
  v_column_name     VARCHAR2(256);
  CURSOR c1 IS
       SELECT column_name, data_type, data_length FROM user_tab_columns
       WHERE table_name = p_tab_name ORDER BY column_id;
  refcur            sys_refcursor; 
BEGIN
  DBMS_OUTPUT.ENABLE(NULL); -- this will hangle dbms_output for huge table.
  FOR i IN c1 LOOP
     v_column_name := i.column_name;
     IF i.data_type in ('DATE', 'CLOB') THEN
     v_column_list := v_column_list||','||v_column_name||' '||i.data_type;
     ELSE v_column_list := v_column_list||','||v_column_name||' '||i.data_type||'('||i.data_length||')';
     END IF;
     --IF i.data_type = 'NUMBER' THEN
        
     --ELSIF i.data_type = 'DATE' THEN
      --v_column_name := i.column_name;
      --ELSIF i.data_type = 'CLOB' THEN
      --v_column_name := i.column_name;
     --ELSIF i.data_type = 'VARCHAR2' then
        -- Following line will hangle single quote in text data.
        --v_column_name := i.column_name;
        --dbms_output.put_line(v_column_name);
     --ELSIF i.data_type = 'CHAR' then
        --v_column_name := i.column_name;
     --END IF;
     v_ref_cur_columns := v_ref_cur_columns||'||'||chr(39)||','||chr(39)||'||'||v_column_name;
  END LOOP;
     --dbms_output.put_line('A='||v_ref_cur_columns);

IF v_column_list is null then
  dbms_output.put_line('--Table '|| p_tab_name || ' NEEXISTUJE');
ELSE
  --dbms_output.put_line(p_tab_name || ' does exist');
  v_column_list     := LTRIM(v_column_list,',');
  v_ref_cur_columns := SUBSTR(v_ref_cur_columns,8);

  v_insert_list     := 'CREATE TABLE DUP_'||p_tab_name||' ('||v_column_list||')';
  v_ref_cur_query   := 'SELECT '||v_ref_cur_columns||' FROM '||p_tab_name;
  --dbms_output.put_line(v_ref_cur_columns);
  --dbms_output.put_line(v_ref_cur_query);
  OPEN refcur FOR v_ref_cur_query;
  LOOP
  FETCH refcur INTO v_ref_cur_output; 
  EXIT WHEN refcur%rowcount = 2;
    --v_ref_cur_output := '('||v_ref_cur_output||');'; 
    --v_ref_cur_output := v_insert_list; 
    DBMS_OUTPUT.PUT_LINE (v_insert_list||';'); 
  --EXECUTE IMMEDIATE (v_ref_cur_output);
  --statemen := v_ref_cur_output;
  commit;
  END LOOP; 
IF v_insert_list is null then
  dbms_output.put_line('--No data in '||p_tab_name);
END IF;
END IF;

  --Exception
  --  When others then
--     dbms_output.put_line('Error='||sqlerrm);

END gen_insert;
-----------------------------------------------------------------------
BEGIN


   FOR i IN tableList.FIRST..tableList.LAST LOOP
       --DBMS_OUTPUT.PUT_LINE('------------------------------------------------- ' );
   --DBMS_OUTPUT.PUT_LINE('PROMPT '||to_char(i)||'. Deleting/Inserting into '|| tableList(i)||';' );
   --DBMS_OUTPUT.PUT_LINE('DELETE FROM '|| tableList(i)||';' );
       gen_insert(tableList(i));
    END LOOP;


END;
/