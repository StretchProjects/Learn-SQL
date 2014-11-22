-- Calculate how much it would cost the company to give everyone a 10% annual bonus, whose take-home pay (salary + comission) 
-- is lower than the average take-home pay for everyone in the company exclusing the president and managers.

select sum(salary + ifnull(commission, 0) * 0.10 as 'Bonus cost' from staff where 
salary + ifnull(commission, 0) <= 
    (select avg(salary + ifnull(commission, 0)) from staff where not staff_job_title in ('President', 'Manager'));