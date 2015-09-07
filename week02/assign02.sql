-- 1
-- count is 23
SELECT COUNT(*) FROM planes
WHERE speed IS NOT NULL;

-- min speed is 90
SELECT * FROM planes
WHERE speed IS NOT NULL
ORDER BY speed
LIMIT 1;

-- max speed is 432
SELECT * FROM planes
WHERE speed IS NOT NULL
ORDER BY speed DESC
LIMIT 1;

-- 2
-- total distance in January 2013 is 27,188,805
SELECT SUM(distance) FROM flights
WHERE year = 2013 AND month = 1;

-- where tailnum missing is 81,763
SELECT sum(distance) FROM flights
WHERE year = 2013 AND month = 1 AND tailnum IS NULL;

-- 3
-- total distance on July 5th, 2013 grouped by manufacture (INNER JOIN)
SELECT p.manufacturer, sum(f.distance)
FROM flights f
INNER JOIN planes p ON p.tailnum = f.tailnum
WHERE f.month = 7 AND f.year = 2013 AND f.day = 5
GROUP BY p.manufacturer;

-- total distance on July 5th, 2013 grouped by manufacture (LEFT OUTER JOIN) the results differ because not all planes have a listed manufacture (I think, which means some right results will not link to a left result)
SELECT p.manufacturer, sum(f.distance)
airlines FROM flights f
LEFT OUTER JOIN planes p ON p.tailnum = f.tailnum
WHERE f.month = 7 AND f.year = 2013 AND f.day = 5
GROUP BY p.manufacturer;

-- 4
-- select all flights where the engine is a "Turbo-fan", the airline is Delta Airlines Inc, with carrier name listed, not abbreviation
SELECT
CONCAT(f.Month,'/',f.Day,'/',f.Year, ' @ ', f.dep_time) AS Date, al.name AS Carrier
FROM flights f
JOIN planes p ON p.tailnum = f.tailnum
JOIN airlines al ON f.carrier = al.carrier
WHERE engine = "Turbo-fan" AND f.carrier = "DL";