-- All equipment entries and wattage values are fictional.
DROP TABLE IF EXISTS equipment;
CREATE TABLE equipment (
    device_id INTEGER PRIMARY KEY,
    facility TEXT,
    device_type TEXT NOT NULL,
    watts INTEGER CHECK (watts >= 0)
);
INSERT INTO equipment (device_id, facility, device_type, watts) VALUES
 (1, 'North', 'Router', 150),
 (2, 'North', 'Switch', 300),
 (3, 'North', 'Server', 500),
 (4, 'North', 'Server', NULL),
 (5, 'South', 'Router', 120),
 (6, 'South', 'Switch', 280),
 (7, 'South', 'Server', 600),
 (8, 'West', 'Switch', 200),
 (9, 'West', 'Server', 400),
 (10, 'West', 'Server', NULL),
 (11, NULL, 'Spare', 100),
 (12, 'North', 'Server', 650);

SELECT facility,
       COUNT(*) AS device_rows,
       COUNT(watts) AS known_watt_values,
       SUM(watts) AS sum_watts,
       ROUND(AVG(watts), 2) AS avg_watts
FROM equipment
GROUP BY facility
ORDER BY facility IS NULL, facility;

SELECT facility, COUNT(*) AS qualifying_rows, SUM(watts) AS sum_watts
FROM equipment
WHERE watts >= 250
GROUP BY facility
ORDER BY facility;

SELECT facility, COUNT(*) AS device_rows, SUM(watts) AS sum_watts
FROM equipment
WHERE facility IS NOT NULL
GROUP BY facility
HAVING SUM(watts) >= 1000
ORDER BY facility;

SELECT facility, device_type, COUNT(*) AS device_rows
FROM equipment
WHERE facility IS NOT NULL
GROUP BY facility, device_type
ORDER BY facility, device_type;