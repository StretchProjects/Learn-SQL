-- Find the total salary paid to all staff over a 12 month period
/*select * from staff;
select sum(salary) * 12 from staff;*/

-- Find the average take-home pay (salary + commision) of everyone except the president
/*select * from staff;
select avg(salary+commission) from staff where staff_job_title <> 'President';*/

-- Mr Doe was hired as a cook, set up a new record on the system!
/*select * from staff;
insert into staff 
(staff_number, staff_surname, staff_job_title, manager_number, hire_date, salary, commission, department_number) 
values (6985, 'Doe', 'Cook', 6788, '2014-10-12', 800, null, 20);
select * from staff;*/

-- Give the lowest paid employee a pay-rise
/*select * from staff order by salary asc;

update staff set salary=810 where staff_number = 6985;
select * from staff order by salary asc;*/


-- Mr Doe wasn't working out and was fired.  Delete his record from the system!
/*delete from staff where staff_number = 6985;
select * from staff;*/

