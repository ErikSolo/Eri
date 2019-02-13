nls_session_parameters, nls_instance_parameters,nls_database_parameters;

select * from V$Session;

select * from gv$session;

select * from dba_jobs_running;
select * from v$process;

select inst_id,sid,serial# from gv$session where username='UTTEST';

select * from V$ACTIVE_SESSION_HISTORY;
select * from V$EVENT_NAME;

alter system kill session '22,19,@1';



BEGIN DBMS_OUTPUT.PUT_LINE(DBMS_DB_VERSION.VERSION || '.' || DBMS_DB_VERSION.RELEASE); END; 
------------------------------------------------------------------------------------------
SELECT * FROM V$VERSION;
SELECT * FROM V$INSTANCE;
----------------------------------------------------------------------------------------
SELECT * FROM V$NLS_PARAMETERS; asd
