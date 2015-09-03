-- 1
SELECT * FROM planes;

-- 2
SELECT CONCAT(Month,'/',Day,'/',Year) AS Date FROM weather;

-- 3
SELECT * FROM planes
ORDER BY seats DESC;

-- 4
SELECT * FROM planes
WHERE engine = 'Reciprocating';

-- 5
SELECT * FROM flights
LIMIT 5;

-- 6
SELECT air_time FROM flights
WHERE air_time > 0 
ORDER BY air_time DESC
LIMIT 1;

-- 7
SELECT air_time FROM flights 
WHERE air_time > 0 AND carrier = 'DL' 
ORDER BY air_time 
LIMIT 1;

-- 8
SELECT * FROM flights 
WHERE carrier = 'AS' AND year = 2013 AND month = 6 AND day >= 1 AND day <= 3;

-- 9
SELECT * FROM airlines 
WHERE name LIKE '%America%';

-- 10
SELECT COUNT(*) FROM flights 
WHERE dest = 'MIA';

-- 11
SELECT COUNT(*) FROM flights 
WHERE dest = 'MIA' AND year = 2013 AND (month = 1 OR month = 7);

-- 12
SELECT avg(alt) FROM airports;