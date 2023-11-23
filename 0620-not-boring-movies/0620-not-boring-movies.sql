# Write your MySQL query statement below
select id,movie,description, rating from Cinema where mod(id,2)=1 and description != "boring" order by rating desc;
# mode(컬럼명,2) = 0 or 1 //2로 나누었을때, 0이면 짝수, 1이면 홀수