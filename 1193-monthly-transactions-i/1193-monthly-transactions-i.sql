# Write your MySQL query statement below
select 
DATE_FORMAT(trans_date, '%Y-%m') as month,  
country, 
COUNT(*) as trans_count,
SUM(IF(state = 'approved', 1, 0)) AS approved_count,
SUM(amount) as trans_total_amount,
SUM(IF(state = 'approved', amount, 0)) AS approved_total_amount
FROM Transactions
GROUP BY month, country;

#DATE_FORMAT(date, format) : 날짜 또는 시간 값을 지정된 형식의 문자열로 변환

# IF(condition, value_if_true, value_if_false)
    #condition: 조건식이며, 참 또는 거짓으로 평가된다.
    #value_if_true: 조건이 참일 때 반환할 값
    #value_if_false: 조건이 거짓일 때 반환할 값