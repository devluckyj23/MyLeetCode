# Write your MySQL query statement below
select TODAY.id from Weather as TODAY join Weather as YESTERDAY 
on date_add(YESTERDAY.recordDATE, interval 1 day) = TODAY.recordDATE 
where TODAY.temperature > YESTERDAY.temperature;