# Write your MySQL query statement below
# ORDER_DATE와 CUSTOMER_PREF_DELIVERY_DATE가 같으면 즉시주문이고, CUSTOMER_ID 각각이 첫번째로 주문한 오더들 중에서 즉시주문의 비율을 구하는 문제.

with base_table as (
select *, rank() over(partition by customer_id order by order_date) as ranking 
from delivery )

#delivery 테이블에서 customer_id를 기준으로 order_date에 따라 랭크 부여 (rank() 함수 사용).
#base_table이라는 임시 테이블을 생성하고 (with), 각 고객에 대한 주문 날짜의 랭킹을 지정합니다.

select round(avg(case when order_date = customer_pref_delivery_date then 1.00 else 0.00 end)*100, 2) as immediate_percentage 
from base_table
where ranking = 1;

#order_date가 customer_pref_delivery_date와 동일한 경우 1.0을, 그렇지 않은 경우 0.0을 반환합니다.
#이렇게 반환된 값에 대한 평균을 계산하고, 100을 곱하여 백분율로 변환합니다.
#round 함수를 사용하여 소수점 둘째 자리까지 반올림합니다.