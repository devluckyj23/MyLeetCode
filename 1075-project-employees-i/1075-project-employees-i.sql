# Write your MySQL query statement below
select p.project_id, round(sum(e.experience_years)/count(p.employee_id),2) as average_years
from Project p left join Employee e
on(p.employee_id=e.employee_id)
group by p.project_id;
# group by를 해서 p의 project_id 끼리 묶어서 count를 조회 하는게 중요했다.