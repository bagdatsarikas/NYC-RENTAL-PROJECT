
--------------  PILLOW PALOOZA  NYC SHORT TERM RENTAL REAL ESTATE PROJECT  -----------

/*
The SQL queries are developed to deeply analyze the Airbnb short-term rental market in New York City. 
This analysis encompasses a variety of dimensions including room type popularity, pricing trends across 
different room types and neighborhoods, and the distribution of listings across boroughs.
By examining metrics such as average prices, number of listings, and pricing variations, 
the queries aim to provide Pillow Palooza with actionable insights into where to invest
and how to strategically price their properties.

*/




-- Join tables for tableau analysis; 

SELECT 
    r.listing_id, 
    p.price, 
    p.borough, 
    p.neighbourhood, 
    p.price_per_month, 
    p.latitude, 
    p.longitude, 
    r.host_name, 
    r.last_review,
    r.minimum_nights,
    r.number_of_reviews, 
    r.reviews_per_month, 
    r.calculated_host_listings_count, 
    r.availability_365, 
    r.booked_days_365, 
    rt.description, 
    rt.room_type
FROM reviews r
INNER JOIN room_types rt ON r.listing_id = rt.listing_id
LEFT JOIN prices p ON r.listing_id = p.listing_id;



/* 
This query ranks Airbnb room types by the number of listings available, 
identifying which types of accommodations are most and least common in New York City. 
*/

--- What is the most and least common room type in NYC airbnb listings 

SELECT room_type as roomtype,
	COUNT(*) as numberoflisting
FROM room_types
GROUP BY 1
ORDER BY 2 DESC;

/*
By calculating the average price associated with each room type, this query helps
to uncover pricing trends, allowing Pillow Palooza to competitively position their offerings in the market.
*/
	
-- What is the average price of a listing by room type?

SELECT room_type as roomtype, 
		ROUND(AVG(price),2) as avr_price
FROM room_types AS r
INNER JOIN prices AS p 
ON r.listing_id = p.listing_id
GROUP BY 1
ORDER BY 2 DESC;


		
/*
These queries compare average daily prices for the most common room type, 'entire home/apt',
and the least common, 'shared room', across various neighborhoods. 
*/


-- 'Entire room/apt' average daily price  across neighbourhood

SELECT
    p.neighbourhood,
    ROUND(AVG(p.price),2) AS average_price
FROM
    prices p
JOIN
    room_types rt ON p.listing_id = rt.listing_id
WHERE
    rt.room_type = 'entire home/apt'
GROUP BY
    p.neighbourhood
ORDER BY 2 DESC;


-- 'Shared room'  average daily price across neighbourhood

SELECT
    p.neighbourhood,
    ROUND(AVG(p.price),2) AS average_price
FROM
    prices p
JOIN
    room_types rt ON p.listing_id = rt.listing_id
WHERE
    rt.room_type = 'shared room'
GROUP BY
    p.neighbourhood
ORDER BY 2 DESC;

/*
These queries provide a breakdown of average prices for most common room type, 'entire home/apt',
and the least common, 'shared room' across NYC boroughs, 
highlighting potentially lucrative areas for investment or necessary adjustments in existing property portfolios.
*/


-- 'Entire room/apt' average daily price for each  borough 

SELECT
    p.borough,
    ROUND(AVG(p.price),2) AS average_price,
    Count(*) as listings
FROM
    prices p
JOIN
    room_types rt ON p.listing_id = rt.listing_id
WHERE
    rt.room_type = 'entire home/apt'
GROUP BY
    p.borough
ORDER BY 3 DESC;


-- 'Shared room' type  average daily price  for each borough 

SELECT
    p.borough,
    ROUND(AVG(p.price),2) AS average_price,
    Count(*) as listings
FROM
    prices p
JOIN
    room_types rt ON p.listing_id = rt.listing_id
WHERE
    rt.room_type = 'shared room'
GROUP BY
    p.borough
ORDER BY 3 DESC;


/*
This query provides a detailed look at the price distribution for the most common room type, 'entire home/apt',
and the least common, 'shared room' across neighborhoods,
offering insights into the highest and lowest price points and the variability within each area.
*/

-- 'Entire home/apt' average daily price variation across neighbourhoods 

SELECT 
		neighbourhood,
    MIN(price) as min_price, 
    ROUND(AVG(price),2) as avg_price,
    MAX(price) as max_price,
    STDDEV(price) as st_deviation,
    count(*)
FROM
		prices p
JOIN 
		room_types rt
ON  p.listing_id = rt.listing_id
WHERE
    rt.room_type = 'entire home/apt'
GROUP BY neighbourhood
ORDER BY 3 DESC;



-- 'Shared room' average daily  price variation across neighbourhoods

SELECT 
		neighbourhood,
    MIN(price) as min_price, 
    ROUND(AVG(price),2) as avg_price,
    MAX(price) as max_price,
    STDDEV(price) as st_deviation,
    count(*)
FROM
		prices p
JOIN 
		room_types rt
ON  p.listing_id = rt.listing_id
WHERE
    rt.room_type = 'shared room'
GROUP BY neighbourhood
ORDER BY 3 DESC;

*/ 
These quesries provide borogh level analysis for company
*/

-- Which borough has the highest average daily price per month?

SELECT 
    borough, 
    ROUND(AVG(price_per_month) * 100) / 100 AS monthly_avg_price
FROM prices
GROUP BY borough
ORDER BY monthly_avg_price DESC
LIMIT 1;


-- How many listings of each room type are in each borough?

SELECT 
		p.borough,
    r.room_type,
    COUNT(*) AS number_of_listings
FROM
		prices as p
JOIN 
		room_types as r ON p.listing_id = r.listing_id

GROUP BY 1, 2
ORDER BY p.borough, number_of_listings DESC;



-- How many listings in each room type category have a price of over $500 per night?

SELECT 
		 room_type,
     COUNT(*) AS number_of_listings
FROM 
		prices p
JOIN
		room_types r
ON p.listing_id = r.listing_id
WHERE 
		p.price > 500
GROUP BY 
		room_type;
    
		-- Further analysis of roomtypes > 500$ per night

SELECT
		room_type,
    borough,
    neighbourhood,
    number_of_reviews,
    availability_365
    
FROM 
		room_types rt
JOIN 
		reviews r
ON 
		r.listing_id=rt.listing_id
LEFT JOIN 
		prices p
ON 
		r.listing_id=p.listing_id
WHERE 
		P.price>500;




-- This query estimates the revenue generated by hosts in each borough
-- What is the estimated amount of revenue generated by hosts in each borough?

SELECT
    p.borough,
    round(SUM(p.price * r.booked_days_365),2) AS estimated_revenue
FROM
    prices p
JOIN
    reviews r ON p.listing_id = r.listing_id
GROUP BY
    p.borough;
    
-- This query estimates the average daily price in each borough   
-- What is the average daily price in each borough ? 

SELECT 
    borough, 
    ROUND(AVG(price),2) AS avg_price
FROM prices
GROUP BY borough
ORDER BY 2 DESC;


-- What is the average price per month for listings in each neighborhood?


SELECT
    neighbourhood,
    ROUND(AVG(price_per_month)*100)/100 AS average_price_per_month
FROM
    prices
GROUP BY
    neighbourhood
ORDER BY
    average_price_per_month DESC;
    
    
-- How many listings have no reviews?
 
 SELECT
    COUNT(*) AS listings_with_no_reviews
FROM
    room_types rt
LEFT JOIN 
		prices p
ON rt.listing_id = p.listing_id
JOIN 
		reviews r
ON r.listing_id = p.listing_id
WHERE
    r.listing_id IS NULL;
    
 -- How do the estimated book days correlate with the price of an Airbnb listing in New York City?
 
 
SELECT
    CORR(p.price, r.booked_days_365) AS correlation_coefficient
FROM
    prices p
JOIN
    reviews r ON p.listing_id = r.listing_id;
    
 -- How do the reviews correlate with the price of an Airbnb listing for each room type ? 
 
 
SELECT room_type,
    CORR(p.price, r.number_of_reviews) AS review_correlation_coefficient,
    CORR(p.price, r.booked_days_365) AS bookdays_correlation_coefficient
FROM
    prices p
JOIN
    reviews r ON p.listing_id = r.listing_id
  
     
JOIN
    room_types ro  ON ro.listing_id = r.listing_id
group by 1;

  
-- correlation analysis between the number of reviews and the average booked days

SELECT CORR(booked_days_365, number_of_reviews) as correlation_coefficient
FROM reviews;

 
 -- What is the average price per room type for listings that have at least 100 reviews
 -- and are available more than 200 days a year?
 
 SELECT
    rt.room_type,
    ROUND(AVG(p.price),2) AS average_price
FROM
    room_types rt
JOIN
    prices p ON rt.listing_id = p.listing_id
JOIN
    reviews r ON p.listing_id = r.listing_id
WHERE
    r.number_of_reviews >= 100 AND
    r.availability_365 > 200
GROUP BY
    rt.room_type;
    





-- What is the distribution of listing prices by neighborhood?

SELECT 
		neighbourhood,
    MIN(price) as min_price, 
    ROUND(AVG(price),2) as avg_price,
    MAX(price) as max_price,
    ROUND(stddev(price),2) as st_deviation,
    COUNT(*) as total_listings
FROM
		prices
GROUP BY neighbourhood
ORDER BY 6 ASC; 

    

-- avg. booked days, number of reviews and availabilit for each room type 

SELECT 
		r.room_type,
    ROUND(avg(re.booked_days_365),2) as avg_booked_days,
    SUM(re.number_of_reviews) as total_reviews,
    ROUND(avg(re.availability_365),2) as avg_availabilty
FROM 
		reviews re
LEFT JOIN 
		prices p
ON re.listing_id=p.listing_id
JOIN 
		room_types r
on p.listing_id=r.listing_id
GROUP BY 1
ORDER BY 2 DESC;


-- 
-- Determine the top 5 hosts who have the highest price_per_month for their listings.


SELECT 
  	host_name,
  	ROUND(SUM(price_per_month)::numeric, 2) AS TotalMonthlyPrice
FROM
    prices p
JOIN 
		reviews r
ON p.listing_id=r.listing_id
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;    


-- Are the top 5 hosts' listings concentrated in specific neighborhoods or boroughs?

SELECT 
    p.borough,		
    p.neighbourhood
FROM
		prices p
JOIN 
		reviews r
ON p.listing_id=r.listing_id
WHERE r.host_name in (
  	SELECT 
  	host_name,
  	ROUND(SUM(price_per_month)::numeric, 2) AS TotalMonthlyPrice
FROM
    prices p
JOIN 
		reviews r
ON p.listing_id=r.listing_id
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5
);
