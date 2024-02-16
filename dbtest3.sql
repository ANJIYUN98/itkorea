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



-- 4 예외 프로시저
drop table tbl_errlog;
create table tbl_errlog( error_code int, error_date datetime, error_msg text);
show errors;
select * from tbl_errlog;
delete from tbl_registration;
select * from tbl_registration;

drop procedure proc_insert_tbl_registration;

delimiter $$
create procedure proc_insert_tbl_registration(in sid varchar(45), in lcode int, lduration varchar(100))
begin 
	DECLARE error_code int;
    DECLARE error_message VARCHAR(255);
	
    declare continue handler for 1062 
    begin
		get DIAGNOSTICS CONDITION 1
			error_code = MYSQL_ERRNO,
            error_message = MESSAGE_TEXT;
		
        insert into tbl_errlog values(error_code,now(),error_message);
    end;
    
    
    declare continue handler for 1452
    begin
		get DIAGNOSTICS CONDITION 1
			error_code = MYSQL_ERRNO,
            error_message = MESSAGE_TEXT;
		
        insert into tbl_errlog values(error_code,now(),error_message);
        
    end;
    
    INSERT INTO tbl_registration VALUES (sid, lcode, lduration);
end $$
delimiter ;

delete from tbl_errlog;
select * from tbl_errlog;
delete from tbl_registration;
select * from tbl_registration;
select * from tbl_student;
select * from tbl_lecture;
call proc_insert_tbl_registration('20190001',1001, '2023-05-22 - 2023-06-21');
call proc_insert_tbl_registration('20190001',1001, '2023-05-22 - 2023-06-21');
call proc_insert_tbl_registration('20190001',7001, '2023-05-22 - 2023-06-21');
call proc_insert_tbl_registration('70190001',1001, '2023-05-22 - 2023-06-21');






-- 5 업데이트 트리거
drop trigger tbl_student_update_trg;

select * from tbl_student;
delimiter $$
create trigger tbl_student_update_trg
after update
on tbl_student
for each row
begin 
	insert into tbl_student_bak values(
    old.s_id, old.s_name, old.s_phone, current_timestamp(), null
    );
end $$
delimiter ;

show triggers;
show create trigger tbl_student_update_trg;

select * from tbl_student;
select * from tbl_student_bak; 


insert into tbl_student values('20191234','나나나','010-1234-1234');
update tbl_student set s_name = '우우우' where s_id='20191234';






-- 6 업데이트 트리거
drop trigger tbl_teacher_update_trg;
select * from tbl_teacher;
delimiter $$
create trigger tbl_teacher_update_trg
after update
on tbl_teacher
for each row
begin 
	insert into tbl_teacher_bak values(
    old.t_id,old.t_name,old.t_phone,old.t_addr, current_timestamp(),null
    );
end $$
delimiter ;

show triggers;
show create trigger tbl_teacher_update_trg;


select * from tbl_teacher;
select * from tbl_teacher_bak; 
insert into tbl_teacher values(7,'아무개','010-222-333', '대구광역시 달서구');
update tbl_teacher set t_name = '아무무' where t_id=7;
update tbl_teacher set t_phone = '010-777-7777' where t_id=7;



-- 7 삭제 트리거
drop trigger tbl_student_delete_trg;

select * from tbl_student;
delimiter $$
create trigger tbl_student_delete_trg
after delete
on tbl_student
for each row
begin 
	insert into tbl_student_bak values(
    old.s_id, old.s_name, old.s_phone, null, current_timestamp()
    );
end $$
delimiter ;

show triggers;
show create trigger tbl_student_delete_trg;

select * from tbl_student;
select * from tbl_student_bak; 

delete from tbl_student where s_id='20191234';



-- 8 삭제 트리거
drop trigger tbl_teacher_delete_trg;
select * from tbl_teacher;
delimiter $$
create trigger tbl_teacher_delete_trg
after delete
on tbl_teacher
for each row
begin 
	insert into tbl_teacher_bak values(
    old.t_id,old.t_name,old.t_phone,old.t_addr, null, current_timestamp()
    );
end $$
delimiter ;

show triggers;
show create trigger tbl_teacher_delete_trg;

delete from tbl_teacher where t_id=7;

select * from tbl_teacher;
select * from tbl_teacher_bak; 

















