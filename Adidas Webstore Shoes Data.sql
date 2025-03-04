--1. Count the number of products available on the adidas website
SELECT count(distinct name) as total_products
FROM shoes_dim
-- "There are 1025 product models in total"

--2. Distribution of adidas products
WITH shoe_totals AS (
    SELECT 
        best_for_wear, 
        COUNT(best_for_wear) AS total
    FROM shoes_dim
    GROUP BY best_for_wear
)
SELECT TOP 10
    best_for_wear, 
    total, 
    FORMAT(ROUND(total * 1.0 / SUM(total) OVER () * 100, 2), 'N2') AS percentage
FROM shoe_totals
ORDER BY total desc

--3. Adidas shoe products are mainly aimed at unisex and the products are mainly for men.
WITH gender as (
	SELECT gender, count(*)	as total 
	FROM shoes_dim
	GROUP BY gender
	)
SELECT gender, total, total*100/SUM(total) OVER () percentage
FROM gender 
ORDER BY total DESC

--4.The most used color sets by Adidas for its products--
SELECT TOP 10 concat(dominant_color,' - ', sub_color1, ' - ', sub_color2) as Adidas_color_set,  count(*) as Total_set
FROM shoes_dim
GROUP BY concat(dominant_color,' - ', sub_color1, ' - ', sub_color2)
ORDER BY 2 DESC


--5. Create table Fact1 and import data using BULK INSERT
CREATE TABLE Shoes_Fact (
    id INT IDENTITY(1,1) PRIMARY KEY,
    price DECIMAL(10,2),  -
    category NVARCHAR(255),  
    size NVARCHAR(50), 
    availability BIT,  
    date DATE,  
    country_code CHAR(2)  
);

BULK INSERT Fact1
FROM 'C:\Windows\Temp\shoes_fact3.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
);

--6. Check stock update date on adidas website
SELECT day(update_date) as update_day, count(*) as total
FROM Fact1
WHERE update_date is not null
GROUP BY day(update_date) 
-- Adidas regularly uploads its products on the 1st, 15th, and 16th of every month to its website store.


--7. Distribution of adidas's shoes price
WITH distribution as
	(SELECT code, name, price,
			CASE 
			 WHEN price >= 300 then '300$ - 500$'
			 WHEN price >= 200 then '200$ - 300$'
			 WHEN price >= 150 then '150$ - 200$'
			 WHEN price >= 100 then '100$ - 200$'
			 WHEN price >= 50 then '50$ - 100$'
			 ELSE '0$ - 50$'
			END AS 'Price_Range'
	FROM 
		   (SELECT distinct f.code, d.name, f.price 
			FROM Fact1 f
			JOIN Shoes_Dim d
			ON f.code = d.id) name_price) 
SELECT Price_Range, Count(*) as Total_Product
FROM distribution
GROUP BY Price_Range
ORDER BY 2 desc
--The two highest price distributions of Adidas products range from $0 -> $50 with 1001 products and $50 -> $100 with 1489 products.

--8. Distribution of adidas category
WITH category as 
	(SELECT category, count(category) as total
	FROM Fact1
	GROUP BY category)
SELECT TOP 5 category, total*100/SUM(total) OVER () as percentage 
FROM category
ORDER BY percentage desc

--9. Size Analyst for US,EU
WITH Size AS (
    SELECT Category, COUNT(*) AS Total_Size
    FROM (
        SELECT size, 
               CASE 
                   WHEN size IN ('3.5', '4','4.5','5','5.5','6','6.5','7','7.5','8','8.5','9','9.5','10','10.5','11','11.5','12','12.5','13','13.5','14', '14.5', '15','16','17') 
                        THEN 'US Size'
                   WHEN size IN ('36','36 1/3', '36 2/3','37 1/3', '38','38 2/3', '39 1/3','40','40 1/3','41 1/3','42','42 2/3', '43 1/3','44','44 2/3','45 1/3','46','46 2/3','47 1/3','48','48 2/3','49 1/3','50','50 2/3','51 1/3','52 2/3','53 1/3','54 2/3', '55 2/3') 
                        THEN 'EU Size'   
                   ELSE 'Other'
               END AS Category
        FROM Fact1
    ) AS Category
    GROUP BY Category
)
SELECT Category, 
       Total_Size * 100 / SUM(Total_Size) OVER () AS Percentage 
FROM Size 
ORDER BY 
    CASE Category 
        WHEN 'US Size' THEN 1
        WHEN 'EU Size' THEN 2
        ELSE 3 
    END;


	
