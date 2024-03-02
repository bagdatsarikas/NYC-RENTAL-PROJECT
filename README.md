# NYC-RENTAL-PROJECT


PILLOW PALOOZA  NYC SHORT TERM RENTAL REAL ESTATE PROJECT
By Bagdat SARIKAS


INTRODUCTION
The project at Pillow Palooza focuses on analyzing the short-term rental market in New York City using Airbnb data. I aim to find out which areas are most popular, understand pricing trends, and see what types of properties are in demand. This information will help the company make smart decisions about where to invest and how to price its rentals.
PROJECT LOGISTICS



PROJECT   BACKGROUND
Pillow Palooza is a start-up focused on disrupting the traditional real estate market by offering short-term rental options for travelers. The company has seen a significant increase in demand for short-term rentals in New York City, but wants to better understand the market in order to optimize their business strategy.


PROJECT AIM
The “ NYC short term rental “ dataset will be analyzed, in order to provide recommendations on how to maximize revenue and occupancy rates for their short-term rental properties to the Pillow Palooza team, which is responsible for leading growth and success in the short-term rental market in New York City.
EXECUTIVE SUMMARY
Market Dominance: Manhattan stands out as the premier borough with the highest average monthly ($5,597.7) and daily rates ($184.00), contributing to the lion's share of revenue at approximately $393.42 million. Brooklyn follows with robust earnings, showcasing a diverse and active rental landscape.
Room Type Profitability: Entire homes/apartments are the most popular and lucrative room type, especially in Manhattan and Brooklyn, which aligns with a higher willingness among guests to pay for privacy and amenities.
Price Sensitivity: A slight negative correlation between price and booked days suggests price is not the sole driver for booking frequency, indicating the need for a multifaceted approach to pricing strategy.
Seasonality and Booking Trends: The lack of seasonal data restricts our ability to analyze demand fluctuations over time. Thus, a recommendation is made to incorporate seasonal tracking in future data collection for more targeted revenue optimization.
High-Value Listings: The presence of high-priced listings, particularly in Manhattan, points to a niche market for upscale accommodations. However, the singular high-priced shared room listing suggests an outlier or unique offering that warrants further investigation.
Strategic Recommendations: Pillow Palooza is advised to prioritize investments in entire homes/apartments in Manhattan and Brooklyn and adopt competitive pricing strategies in other boroughs to attract a broader customer base. Emphasis on enhancing listing features, coupled with dynamic pricing during peak seasons, can significantly bolster revenue. Moreover, incorporating guest reviews and satisfaction metrics is essential for building trust and justifying premium pricing.





1. PYTHON DATA CLEANING AND WRANGLING 
Datasets: prices.csv, roomtypes.xlsx, reviews.tsv. 
Data Merging: Merge multiple DataFrames using listing_id as the unique key after confirming data type consistency and uniqueness across all datasets.
Data Cleaning Preparations: Backed up original data, ensured correct data types and missing values for columns, and removed any duplicate rows.
Handling Missing Values: Removed a small number of missing values in ‘Host_name’ and ‘description’ columns as their absence was negligible and didn't impact the overall analysis.
Data Standardization: Split the ‘nbhood_full’ column into separate Borough and Neighborhood columns and standardize the variations in room_type descriptions.
Data Type Conversions: Converted ‘price’ to numeric, ‘room_type’ and borough to categorical, and standardized and converted ‘last_review’ to datetime data type.
Handling Outliers in 'price' Column: Identified outliers using the IQR method, assessed their relevance, and removed or retained them based on their impact on the analysis.
Final Cleaning Steps: Eliminated listings with zero price and unreasonably high values (e.g., $7,500 for a shared room) and cleaned leading/trailing whitespaces in the dataset.

2. ANALYSIS AND INSIGHTS WITH SQL 
GENERAL FINDINGS 

ROOM TYPE
AVG. PRICE
TOTAL LISTINGS
Entire home/apartment
197.17$
13266
Private room
81.67$
11356
Shared room
53.65$
587



What is the average price for room types in NYC rental listings? 
Analysis and conclusion:
Entire home/apartment: With an average price of $197.17, this category is the most expensive. This suggests that guests are willing to pay a premium for the privacy, space, and possibly the amenities that come with renting an entire home or apartment.
Private room: At an average price of $81.67, private rooms are less than half the price of an entire home/apartment. This option strikes a balance between affordability and privacy. It's an appealing choice for solo travelers or couples who need a private space but do not require the facilities of an entire apartment. 
Shared room: The most affordable option comes at an average price of $53.65. Shared rooms are likely the choice for travelers on a tight budget. 


Recommendation:
To maximize Airbnb revenue, Pillow Palooza should enhance entire homes/apartments with premium amenities, market private rooms to budget-conscious solo travelers and couples, and promote shared rooms as social, economical options.
Marketing efforts should be strategically targeted, promoting the unique features of the most lucrative room types to the right audience segments. Investment and expansion decisions must be data-driven, focusing on room types and locations that demonstrate both high average prices and strong demand
Implementing dynamic pricing and targeted marketing for each room type will attract a diverse clientele and optimize occupancy and revenue across the board.
Encourage and incentivize guest reviews, especially for higher-priced listings, to build trust and justify premium pricing through verified guest experiences.

What are the most and least popular room types, and how does their pricing vary across neighborhoods?
Analysis and conclusion:
The 'entire home/apt' category is the most popular, with 13,266 listings, followed by 'private room' with 11,356, and 'shared room' is the least popular with only 587 listings.
For the "entire home/apt" room type, neighborhoods such as Midtown, Westchester Square, Flatiron District, SoHo, NoHo, Theater District, and Tribeca exhibit significant pricing diversity. Sea Gate, in particular, stands out with an exceptionally broad price range, indicating a pronounced variability in pricing for entire homes and apartments. However, it's important to note that neighborhoods like Sea Gate and Westchester Square, which have only a few listings, show high standard deviations. This suggests that their observed pricing variability may not reliably represent the overall pricing trends in those areas. This conclusion is supported by the analysis of box plots, which visualize the extent of pricing variation across neighborhoods for the "entire home/apt" category.
In the shared room category, Murray Hill exhibits a greater diversity in pricing, followed by Williamsburg, Brighton Beach, Rego Park, Sunset Park, Briarwood, and the Upper East Side, east new york,However, Murray Hill, with only two listings showing a high variation standard deviation, don't  accurately reflect the general pricing trend in that area. This conclusion is supported by the analysis of box plots.
Further Analysis:
Does seasonal trends affect pricing and popularity for each room across neighborhoods?
it's significant to mention that the dataset lacks booking date information, precluding a direct assessment of seasonal trends' impact. 
Why do certain neighborhoods have higher variation?
Through borough level analysis, the observed pricing variations within Manhattan's neighborhoods for different room types, particularly the heightened variation for entire homes/apartments, underscore the influence of location on rental prices. Similarly, the notable diversity in shared room prices across Brooklyn and Manhattan neighborhoods highlights how local factors drive price variability. 
How do guest reviews and booked days correlate with pricing for each room type?  
The correlation coefficients for the three room types—shared rooms, entire homes/apartments, and private rooms—are all very close to zero, indicating a very weak relationship between guest reviews and pricing.

ROOM TYPE
Correlation - price  & reviews
Correlation - price  & bookeddays
Entire home/apartment
-0.088
-0.15
Private room
-0.012
-0.03
Shared room
0.003
0.04


This suggests that reviews and booked days do not significantly influence the pricing of Airbnb listings in these categories.


Recommendation:
For neighborhoods like Sea Gate, Westchester Square and Murray Hill with few listings, the sample size is sufficient to make reliable inferences. 
It is recommended for the company to focus its efforts and resources on the 'entire home/apt' and 'private room' categories, as they are the most popular and have significantly higher listings compared to 'shared room'. Additionally, monitoring and optimizing the pricing and availability of listings in these popular categories can help the company maximize its revenue and customer satisfaction.
There is no correlation between price & booked days  and price & reviews for each room type.  The  pricing strategies for these room types should not be heavily based on review and booked_days metrics but rather other factors should be analyzed along with further statistical tests like regression analysis. 
For investment in entire homes/apartments and shared rooms, neighborhoods with high pricing variability are promising. They offer diverse rental markets and the potential for strategic investments to maximize returns across various renter segments.
A seasonal trend analysis is required to determine if seasonality is another factor affecting pricing outliers in neighborhoods. But without the appropriate data such as time-stamped booking information or seasonal indicators, we cannot conduct a thorough analysis of seasonal trends and their impact on pricing outliers in neighborhoods.

How has demand for short-term rentals in New York City changed over time, and are there any seasonal trends that could impact business decisions?

Due to the nature of our dataset, which lacks specific booking dates or detailed temporal information, our ability to directly analyze changes in demand for short-term rentals over time or identify definitive seasonal trends is limited. 

For a more comprehensive understanding of how demand fluctuates over time, additional data that captures booking dates or seasonal patterns would be required.


How many listings in each room type category have a price of over $500 per night?

ROOM TYPE
NUMBER OF LISTINGS
Entire home/apartment
395
Private room
19
Shared room
1


Analysis and conclusion:
The significant number of high-priced entire homes/apartments indicates a strong demand for spacious, private, and potentially upscale accommodations. The presence of 19 private rooms at this price point is intriguing, as it suggests a market for exclusive or uniquely positioned private accommodations. The solitary shared room listed at this price is highly unusual and may represent an exceptional offering or a unique market condition.
The analysis reveals that the most expensive listings for entire homes or apartments are predominantly found in Manhattan and Brooklyn. Additionally, shared rooms command high prices particularly in the Murray Hill neighborhood of Manhattan, while private rooms fetching premium rates are mainly situated in both Manhattan and Brooklyn.
Further Analysis:
What is the location  for high-priced listings in these room type categories?
The analysis reveals that the most expensive listings for entire homes or apartments are predominantly found in Manhattan. 

ROOM TYPE > 500$ per night
Manhattan
Brooklyn
Entire home/apartment
292


Private room
14


Shared room
1




What are the demographic profiles of guests booking these high-priced listings?
While assessing the demographic profiles of guests booking high-priced listings would significantly enrich our understanding of market segments and consumer preferences, our current dataset does not include this specific information
Is there certain times of the year when these listings are more popular due to events, holidays, or other factors.
There is absence of data on the seasonality of bookings. 

Recommendation:
With Manhattan and Brooklyn hosting the majority of high-priced entire homes/apartments and private rooms, these boroughs should be the primary focus for marketing and investment strategies.
The existence of a high-priced shared room indicates a potential market for exceptional shared accommodations. Investigate the characteristics that allow this listing to command a high price and consider replicating these features where possible.
In the absence of direct data on seasonality, use external sources to identify local events, holidays, and peak travel seasons. Tailor marketing efforts to these periods to maximize occupancy and revenue.

Which borough has the highest average price per month and what is the estimated amount of revenue generated by hosts. 

BOROUGH
AVG. MONTHLY PRICE
Manhattan
5,597.7 $



BOROUGH
ESTIMATED REVENUE
Manhattan
393,420,567.00$
Queens
58,404,083.00$
Brooklyn
279,130,240.00$
Staten Island
3,443,919.00$
Bronx
9,324,180.00$


Analysis and conclusion:
Manhattan leads with the highest average monthly price at $5,597.7, reflecting its status as the most premium borough in terms of rental pricing.
In terms of estimated revenue, Manhattan also dominates with $393.42 million, Brooklyn follows with substantial revenue of $279.13 million, indicating a thriving rental market. 
In contrast, Queens, the Bronx, and Staten Island present significantly lower revenue figures, suggesting less demand or lower pricing in these areas. 
Further Analysis:
What are the average daily rates for each borough? How pricing strategies affect the revenue ? 

BOROUGH
AVG. DAILY PRICE
Manhattan
184.00 $
Queens
121.97 $
Brooklyn
92.81 $
Staten Island
86.04 $
Bronx
79.24 $

Manhattan's leading average daily price at $184.00, followed by Brooklyn, Queens, Staten Island, and the Bronx.  Manhattan, with the highest average rate, unsurprisingly generates the most revenue, underscoring its status as a premium lodging destination. Brooklyn, while having a lower average daily rate than Manhattan, still sees substantial revenue, indicating a strong market presence. Queens, Staten Island, and the Bronx, with progressively lower rates, contribute less to overall revenue, suggesting that these boroughs might appeal to budget-conscious travelers or have fewer listings. 
What is the impact of seasonality on revenue by borough?
Analyzing revenue data by borough over different seasons enables businesses to identify trends, capitalize on peak periods, and implement targeted marketing strategies to maximize revenue potential. Without access to seasonal data, we are unable to directly assess the impact of seasonality on revenue by borough or identify specific seasonal trends and patterns.
What is the distribution of room types within each borough and their contribution to revenue?
The tableau visualization suggests that entire homes/apartments are the most profitable room type for Airbnb hosts, especially in high-demand boroughs like Manhattan and Brooklyn, while the revenue from private and shared rooms is considerably lower. This indicates that investment in entire home/apartment listings, particularly in these boroughs, could be a strategic move to maximize earnings.

Recommendation:
The prime recommendation is to concentrate on Manhattan due to its high average prices and revenue, indicating a strong market for luxury and upscale rentals. Investment in high-quality entire homes and apartments in this borough should be prioritized. 
Brooklyn's significant revenue despite lower average prices points to a diverse and active market, where strategic investments in the “entire room / apt”  could also yield good returns. 
In Queens, the Bronx, and Staten Island, where revenue is lower, the company should consider more competitive pricing and marketing unique property features to boost appeal. Additionally, implementing dynamic pricing strategies during peak tourist seasons or around major events could further enhance profitability in these key boroughs.
Based on the analysis, Manhattan emerges as the most lucrative borough with the highest average monthly and daily rates, suggesting a targeted approach for high-end, entire home/apartment listings there could maximize revenue. 


How do the estimated book days correlate with the price of an Airbnb listing in New York City?
The correlation coefficient of -0.07963883976667008 between estimated book days and the price of an Airbnb listing in New York City indicates a very slight negative relationship. 
This suggests that as the price of a listing increases, the number of booked days tends to decrease slightly, and vice versa. However, the value is very close to zero, implying that the relationship is weak and not particularly significant. 
In practical terms, price does not appear to be a strong predictor of the number of days a listing will be booked, according to this dataset. Other factors not captured in this correlation may have a more substantial impact on booking days.
Further analysis must be conducted. 


