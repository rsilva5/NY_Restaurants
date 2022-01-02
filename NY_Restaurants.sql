-- Start by getting a feel for the nomnom table:
SELECT *
FROM nomnom
LIMIT 10;
-- The table consists of columns: name, neighborhood, cuisine, review, price, and health grade

-- What are the distinct neighborhoods?
SELECT DISTINCT neighborhood
FROM nomnom;
-- The distinct neighborhoods are Brooklyn, Midtown, Chinatown, Uptown, Queens, Downtown 

-- What are the distinct cuisine types?
SELECT DISTINCT cuisine
FROM nomnom;
-- The distinct cuisine types are Steak, Korean, Chinese, Pizza, Ethiopian, Vegeterarian, Italian, Japanese, American, Mediterranean, Indian, Soul Food and Mexican

-- Chinese Options
SELECT *
FROM nomnom
WHERE cuisine = "Chinese"
ORDER BY neighborhood;
-- There are 11 Chinese options - 1 in Brooklyn, 1 in Midtown, 1 in Queens, 2 in Downtown, and 6 in Chinatown 

-- Return all the restaurants with reviews of 4 and above 
SELECT * 
FROM nomnom
WHERE review > 4
ORDER BY neighborhood;

-- Return all the restaurants that are Italian and $$$
SELECT * 
FROM nomnom 
WHERE cuisine = "Italian"
  AND price = "$$$"
ORDER BY neighborhood;
-- The are six Italian resturants that fit the criteria of $$$. Three in Brooklyn, two in Downtown, and one in Uptown.

-- Your coworker Trey can’t remember the exact name of a restaurant he went to but he knows it contains the word ‘meatball’ in it.Can you find it for him using a query?
SELECT *
FROM nomnom 
WHERE name LIKE '%meatball%'
ORDER BY neighborhood;

-- Find all the close by spots in Midtown, Downtown or Chinatown.
SELECT * 
FROM nomnom 
WHERE neighborhood = "Midtown"
  OR neighborhood = "Downtown" 
  OR neighborhood = "Chinatown"
  ORDER BY neighborhood;

-- Find all the health grade pending restaurants (empty values).
SELECT name, neighborhood, health
FROM nomnom
WHERE health IS NULL;

-- Create a Top 10 Restaurants Ranking based on reviews.
SELECT *
FROM nomnom 
ORDER BY review DESC
LIMIT 10;

-- New rating system
SELECT *,
CASE
  WHEN review > 4.5 THEN "Extraordinary"
  WHEN review > 4 THEN "Excellent"
  WHEN review > 3 THEN "Good"
  WHEN review > 2 THEN "Fair"
  ElSE "Poor"
END "Rating"
FROM nomnom
ORDER BY "review" DESC;

-- Where are the restaurants with a health grade of an A most located?
SELECT COUNT(name) AS 'Total', neighborhood, health 
FROM nomnom 
WHERE health = 'A'
GROUP BY neighborhood, health
ORDER BY 1 DESC;
-- Downtown has the most restaurants with a health grade of an A with a total of 15. 

-- Where the priciest restaurants located 
SELECT COUNT(name) AS 'Total', neighborhood, price 
FROM nomnom 
GROUP BY neighborhood, price
ORDER BY price DESC;
-- The priciest restaurant is located in Brooklyn

-- Which cuisine are you most likely to find in each neighborhood?
SELECT cuisine, COUNT(cuisine) AS 'Total_Restaurants', neighborhood 
FROM nomnom
GROUP BY 1,3
ORDER BY 3, 2 DESC;
-- Based on this data set if one is in Brooklyn they are more likely to find an Italian or a Pizza restaurant. If one is in Chinatown they are more likely to find a Chinese restaurant. If one is in Downtown they are more likely to come across an American restaurant. If one is in Midtown they will see more Korean restaurants. In Queens they will see a Chinese restaurant. Lastly, in Uptown one will see more American restaurants. 

