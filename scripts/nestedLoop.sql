DECLARE
  v_temp VARCHAR(50);
  query1 VARCHAR2(1000);
  c1 SYS_REFCURSOR;
  CURSOR c2
  IS
    SELECT COLUMN_NAME xxx FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'EMPLOYEES';
BEGIN
  FOR s2 IN c2
  LOOP
    --do something
    query1 := 'SELECT ' ||s2.xxx||' FROM EMPLOYEES';
    OPEN c1 FOR query1 ;
    LOOP
      FETCH c1 INTO v_temp;
      DBMS_OUTPUT.PUT_LINE('COLUMN:'||s2.xxx||', VALUE:'|| v_temp);
      EXIT
    WHEN c1%NOTFOUND;
    END LOOP;
    CLOSE c1;
  END LOOP;
END;
/