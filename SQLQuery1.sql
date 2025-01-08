


 with hotels as 
  (select *from ['2018']
  union 
  select *from ['2019']
  union 
  select * from ['2020']
  )
  --select * from hotels 

--SELECT (stays_in_weekend_nights + stays_in_week_nights)*adr AS TotalStays FROM Hotels
/*SELECT arrival_date_year,arrival_date_month,
(stays_in_weekend_nights + stays_in_week_nights)*adr AS Revenue
FROM Hotels*/

-- Q1: What is the profit percentage for each month across all years?
/*
SELECT arrival_date_year,arrival_date_month,
ROUND(SUM((stays_in_weekend_nights + stays_in_week_nights)*adr),0) AS profit_percentage 
FROM Hotels
GROUP BY arrival_date_month ,arrival_date_year

-- Q2: Which meals and market segments (e.g., families, corporate clients, etc.) contribute the most to the total revenue for each hotel annually?
select meal ,market_segment ,ROUND(SUM((stays_in_weekend_nights + stays_in_week_nights)*adr),0) AS profit_percentage 
from hotels 
group by  meal ,market_segment
order by profit_percentage DESC

 --Q3: How does revenue compare between public holidays and regular days each year?
select ROUND(sum((stays_in_weekend_nights) *adr),0) AS reven_public_holidays 
,ROUND(sum((stays_in_week_nights) *adr),0) AS reven_regular_days ,
ROUND(SUM(stays_in_week_nights * adr), 0) - ROUND(SUM(stays_in_weekend_nights * adr), 0) AS revenue_difference
from hotels 
 
 -- Q4: What are the key factors (e.g., hotel type, market type, meals offered, number of nights booked) significantly impact hotel revenue annually?
 SELECT 
    hotel,
    market_segment,
   meal,
   SUM(stays_in_weekend_nights + stays_in_week_nights) AS total_nights_booked,
    ROUND(SUM((stays_in_weekend_nights + stays_in_week_nights) * adr), 0) AS total_revenue
FROM 
    hotels
GROUP BY 
    hotel, market_segment, meal
ORDER BY 
   total_revenue DESC;
   

-- Q5: Based on stay data, what are the yearly trends in customer preferences for room types (e.g., family rooms vs. single rooms), and how do these preferences influence revenue?

SELECT reserved_room_type, COUNT(*) AS total_bookings,
   ROUND(SUM((stays_in_weekend_nights + stays_in_week_nights)*adr),0) AS  total_revenue 
    hotels
GROUP BY 
    reserved_room_type
ORDER BY 
     total_revenue DESC;

 --Q6 :What is the distribution of customers by country and how does it impact revenue?
SELECT 
    country,
    COUNT(*) AS number_of_customers,
   ROUND(SUM((stays_in_weekend_nights + stays_in_week_nights)*adr),0) AS total_revenue
FROM 
    hotels
GROUP BY 
    country
ORDER BY 
    total_revenue DESC;
	

--Q7 :What are the most requested room types annually
SELECT 
    arrival_date_year,
    COUNT(*) AS total_cancellations
FROM 
    hotels
WHERE 
    is_canceled = 1
GROUP BY 
    arrival_date_year
ORDER BY 
    arrival_date_year;
	
--Q8 :How Many Bookings Were Cancelled?

SELECT 
    COUNT(*) AS total_cancellations
FROM 
    hotels
WHERE 
    is_canceled = 1;

--Q9 How Long Do People Stay in the Hotel?

SELECT 
    ROUND(AVG(stays_in_weekend_nights + stays_in_week_nights), 2) AS avg_stay_duration
FROM 
    hotels; 
	
--Q 10: Count the number of required car parking spaces.
SELECT
    SUM(required_car_parking_spaces) AS total_parking_spaces
FROM 
    hotels;
	*/

-- Q11: Number of reservations per month
SELECT 
     arrival_date_month ,
     COUNT(*) AS total_bookings
FROM 
    hotels
GROUP BY 
    arrival_date_month
ORDER BY 
    arrival_date_month 
          