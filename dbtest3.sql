use lmsdb;
select * from tbl_current_lecture;
select * from tbl_classroom;
select * from tbl_lecture;
select * from tbl_teacher;

-- 1번 inner join sql쿼리문 
select no, lec_duration, lec_time, t_name, lec_name, CL.class_no
from tbl_current_lecture CL
inner join tbl_classroom C
on CL.class_no = C.class_no
inner join tbl_lecture L
on CL.lec_code = L.lec_code
inner join tbl_teacher T
on CL.t_id = T.t_id;


-- 2 view table만들기
create or replace view view_current_lecture
as
select no, lec_duration, lec_time, t_name, lec_name, CL.class_no
from tbl_current_lecture CL
inner join tbl_classroom C
on CL.class_no = C.class_no
inner join tbl_lecture L
on CL.lec_code = L.lec_code
inner join tbl_teacher T
on CL.t_id = T.t_id;


select * from view_current_lecture;



-- 3 피벗테이블 만들기


select * from view_current_lecture;
select lec_name,
count(case when lec_time='09:00 - 12:00' then 1 end) as '09:00 - 12:00',
count(case when lec_time='13:00 - 15:00' then 1 end) as '13:00 - 15:00',
count(case when lec_time='15:00 - 17:00' then 1 end) as '15:00 - 17:00'
from view_current_lecture group by lec_name with rollup;



-- 4
create table tbl_errlog(error_code int, error_date datetime, error_msg text);
show errors;
select * from tbl_errlog;

select * from tbl_registration;


delimiter $$
create procedure proc_insert_tbl_registration(in sid varchar(45), in lcode int, lduration varchar(100))

begin 
	DECLARE error_code VARCHAR(5);
    DECLARE error_message VARCHAR(255);
	
    declare continue handler for 1062 
    begin
		show errors;
		get DIAGNOSTICS CONDITION 1
			error_code = MYSQL_ERRNO,
            error_message = MESSAGE_TEXT;
		
        insert into tbl_errlog values(error_code,now(),error_message);
    end;
    
    
    declare continue handler for 1452
    begin
		show errors;
		get DIAGNOSTICS CONDITION 1
			error_code = MYSQL_ERRNO,
            error_message = MESSAGE_TEXT;
		
        insert into tbl_errlog values(error_code,now(),error_message);
        
    end;
    
    
end $$
delimiter ;

call proc_insert_tbl_registration('20190001',1001, '2023-05-22 - 2023-06-21');
call proc_insert_tbl_registration('20190001',1001, '2023-05-22 - 2023-06-21');
call proc_insert_tbl_registration('20190001',7001, '2023-05-22 - 2023-06-21');
call proc_insert_tbl_registration('70190001',1001, '2023-05-22 - 2023-06-21');
























