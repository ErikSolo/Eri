begin
    dbms_scheduler.create_job(job_name        => 'TRIC_DETAIL',
                              job_type        => 'STORED_PROCEDURE',
                              job_action      => 'DUPLIS',
                              start_date      => to_timestamp ('1.1.2019 20.12.00', 'MM.DD.YYYY HH24:MI:SS'),
                              end_date        => null,
                              --repeat_interval => 'freq=daily; byhour=10; byminute=0; bysecond=0;',
                              enabled         => true,
                              auto_drop       => false);
                              --comments        => 'your descripn');
end;
