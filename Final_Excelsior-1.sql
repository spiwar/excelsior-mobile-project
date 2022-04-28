/*
Project 1: Excelsior Mobile Report
Khoa Phan
*/

USE [21WQ_BUAN4210_Lloyd_ExcelsiorMobile];

-- Visualization Questions --

-- 1 -- 
-- A 
-- Returns a concentrated string from FirstName and LastName as Full Name, Minutes, DataInMB as Data Usage, Texts, and Total
-- from the Subscriber, LastMonthUsage, and Bill table.
-- Grouped by City.
SELECT CONCAT(FirstName,' ', LastName) AS 'Full Name', Minutes, DataInMB as 'Data Usage', Texts, Total
FROM Subscriber AS S
	 JOIN LastMonthUsage AS LMU
	 ON S.MIN = LMU.MIN
		JOIN Bill AS B
		ON LMU.MIN = B.MIN
ORDER BY 'Full Name';

-- B
-- Returns the City, Average of Minutes, DataInMB, Texts, Total
-- from the Subscriber, LastMonthUsage, and Bill table
-- Grouped by City.
SELECT City, AVG(Minutes) as 'Minutes', AVG(DataInMB) AS 'Data', AVG(Texts) as 'Text', AVG(Total) AS 'Total'
FROM Subscriber AS S
	 JOIN LastMonthUsage AS LMU
	 ON S.MIN = LMU.MIN
		JOIN Bill AS B
		ON LMU.MIN = B.MIN
GROUP BY City;

-- C
-- Returns the City, Sum of Minutes, DataInMB, Texts, Total
-- from the Subscriber, LastMonthUsage, and Bill table
-- Grouped by City.
SELECT City, SUM(Minutes) as 'Minutes', SUM(DataInMB) AS 'Data', SUM(Texts) as 'Text', SUM(Total) AS 'Total'
FROM Subscriber AS S
	 JOIN LastMonthUsage AS LMU
	 ON S.MIN = LMU.MIN
		JOIN Bill AS B
		ON LMU.MIN = B.MIN
GROUP BY City;

-- D
-- Returns the PlanName, Average of Minutes, DataInMB, Texts, Total
-- from the Subscriber, LastMonthUsage, and Bill table
-- Grouped by PlanName.
SELECT PlanName, AVG(Minutes) as 'Minutes', AVG(DataInMB) AS 'Data', AVG(Texts) as 'Text', AVG(Total) AS 'Total'
FROM Subscriber AS S
	 JOIN LastMonthUsage AS LMU
	 ON S.MIN = LMU.MIN
		JOIN Bill AS B
		ON LMU.MIN = B.MIN
GROUP BY PlanName;

-- E
-- Returns the PlanName, Sum of Minutes, DataInMB, Texts, Total
-- from the Subscriber, LastMonthUsage, and Bill table.
-- Grouped by PlanName.
SELECT PlanName, SUM(Minutes) as 'Minutes', SUM(DataInMB) AS 'Data', SUM(Texts) as 'Text', SUM(Total) AS 'Total'
FROM Subscriber AS S
	 JOIN LastMonthUsage AS LMU
	 ON S.MIN = LMU.MIN
		JOIN Bill AS B
		ON LMU.MIN = B.MIN
GROUP BY PlanName;




-- Non-visualization Questions -- 

-- 1 --

-- A
-- Returns the Top 2 City, Count of City as AmountofCustomers 
-- from the Subscriber table.
-- Grouped by City, Ordered by AmountofCustomers in descending order.
SELECT TOP 2 City, COUNT(City) AS AmountofCustomers
FROM Subscriber
GROUP BY City
ORDER BY AmountofCustomers DESC;

-- B
-- Returns the top 3 City, Count of City as AmountofCustomers from the Subscriber table.
-- Grouped by City, Ordered by AmountofCustomers in ascending order.
SELECT TOP 3 City, COUNT(City) AS AmountofCustomers
FROM Subscriber
GROUP BY City
ORDER BY AmountofCustomers ASC;

-- C
-- Returns the Top 1 PlanName with the least amount of customers from the Subscriber table.
-- Grouped by PlanName, Ordered by AmountofCustomers in ascending order.
SELECT TOP 1 PlanName, COUNT(PlanName) AS AmountofCustomers
FROM Subscriber
GROUP BY PlanName
ORDER BY AmountofCustomers ASC;


-- 2 --

-- A
-- Returns Type, the Count of Type as NumberofUsers from the Device table
-- Grouped by Type, Ordered by Type in descending order.
SELECT Type, COUNT(Type) AS 'NumberofUsers'
FROM Device
GROUP BY Type
ORDER BY Type DESC;

-- B
-- Returns a concentrated string from First Name and Last Name as CustomerName
-- from the Device, DirNums, and Subscriber table.
-- Where the Type is Apple (from 2A).
SELECT CONCAT(FirstName,' ', RTRIM(LastName)) AS CustomerName
FROM Device as D
	 JOIN DirNums as DN
	 ON D.IMEI = DN.IMEI
		JOIN Subscriber as S
		ON S.MDN = DN.MDN
WHERE Type = 'Apple';

-- C
-- Returns a concentrated string from First Name and Last Name as CustomerName and YearReleased
-- from the Device, DirNums, and Subscriber table.
-- Where YearReleased is less than 2018.
SELECT CONCAT(FirstName,' ', RTRIM(LastName)) AS CustomerName, YearReleased
FROM Device as D
	 JOIN DirNums as DN
	 ON D.IMEI = DN.IMEI
		JOIN Subscriber as S
		ON S.MDN = DN.MDN
WHERE YearReleased < 2018;


-- 3 --

-- A
-- Returns the Top 3 City, Sum of DatainMB as DataUsage 
-- from the LastMonthUsage, Subscriber, and MPlan table.
-- Grouped by City, and ordered by Sum of DatainMB in descending order.
SELECT Top 3 City, SUM(DatainMB) as DataUsage
FROM LastMonthUsage as LMU
	 JOIN Subscriber as S
	 ON LMU.MIN = S.MIN
	 JOIN MPlan as MP
	 ON S.PlanName = MP.Planname
GROUP BY City
ORDER BY SUM(DatainMB) DESC;
 

 -- B
 -- Returns City and PlanName
 -- from the Subscriber and MPlan table.
 -- Where City is Olympia or Bellevue or Seattle.
 -- Ordered by City.
SELECT City, S.PlanName
FROM Subscriber as S
     JOIN MPlan as MP
	 ON S.PlanName = MP.Planname
WHERE City IN ('Olympia','Bellevue','Seattle')
ORDER BY City;

	 
--
-- 4 --

-- A 
-- Returns the Top 1 of a concentrated string from FirstName and LastName as CustomerName, Total
-- from the Subscriber, and Bill table.
-- Ordered by Total in descending order.
SELECT Top 1 CONCAT(FirstName,' ', LastName) AS CustomerName, Total
FROM Subscriber AS S
	 JOIN Bill AS B
	 ON S.MIN = B.MIN
ORDER BY Total DESC;

-- Returns the Top 1 PlanName, Sum of Total as Revenue
-- from Subscriber, and Bill table
-- Grouped by PlanName, and ordered by Sum of Total in descending order
SELECT Top 1 PlanName as 'Plan Name', SUM(Total) as Revenue
FROM Subscriber AS S
	 JOIN Bill AS B
	 ON S.MIN = B.MIN
GROUP BY PlanName
ORDER BY SUM(Total) DESC;


-- 5 -- 
-- Returns Top 1 ZipCode, Sum of Minutes 
-- from the Subscriber, LastMonthUsage table.
-- Grouped by Zipcode, and Ordered by Sum of Minutes in descending order.
SELECT Top 1 ZipCode, SUM(Minutes) as Minutes
FROM Subscriber AS S
	 JOIN LastMonthUsage AS LMU
	 ON S.MIN = LMU.MIN
GROUP BY ZipCode
ORDER BY SUM(Minutes) DESC;

-- B
-- Returns Top 2 City, Maximum minus minimum value of minutes as 'Difference in Minutes' 
-- from the Subscriber, LastMonthUsage table
-- Grouped by City, Ordered by Difference in Minutes in descending order.
SELECT Top 2 City, MAX(Minutes) - MIN(Minutes) as 'Difference in Minutes'
FROM Subscriber AS S 
	 JOIN LastMonthUsage AS LMU
	 ON S.MIN = LMU.MIN
WHERE Minutes NOT BETWEEN 200 AND 700 
GROUP BY City
ORDER BY 'Difference in Minutes' DESC;

	