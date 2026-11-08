-- OSSQL.006 | INNER JOIN and LEFT JOIN
-- Standalone SQLite 3 training database. All device labels and rates are fictional.
-- Use only with a disposable database; the DROP statements reset these training tables.
PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS miners;
DROP TABLE IF EXISTS racks;

CREATE TABLE racks (
    rack_id INTEGER PRIMARY KEY,
    rack_name TEXT NOT NULL UNIQUE,
    location TEXT NOT NULL
);

CREATE TABLE miners (
    miner_id INTEGER PRIMARY KEY,
    model TEXT NOT NULL,
    rack_id INTEGER REFERENCES racks(rack_id),
    rated_hashrate_th INTEGER NOT NULL CHECK (rated_hashrate_th > 0)
);

INSERT INTO racks (rack_id, rack_name, location) VALUES
    (10, 'Rack A', 'Hall 1'),
    (20, 'Rack B', 'Hall 1'),
    (30, 'Rack C', 'Hall 2'),
    (40, 'Rack D', 'Hall 2');

INSERT INTO miners (miner_id, model, rack_id, rated_hashrate_th) VALUES
    (1001, 'Training A', 10, 140),
    (1002, 'Training B', 10, 188),
    (1003, 'Training C', 20, 220),
    (1004, 'Training D', NULL, 100),
    (1005, 'Training E', 30, 188),
    (1006, 'Training F', 30, 270),
    (1007, 'Training G', NULL, 140);

-- An optional child-key index can help some joins; no benchmark is claimed.
CREATE INDEX idx_miners_rack_id ON miners(rack_id);

-- Exercise 1: only the assigned miners (five rows).
SELECT m.miner_id, m.model, r.rack_name
FROM miners AS m
INNER JOIN racks AS r ON m.rack_id = r.rack_id
ORDER BY m.miner_id;

-- Exercise 2: all seven miners, with NULL for missing racks.
SELECT m.miner_id, m.model, r.rack_name
FROM miners AS m
LEFT JOIN racks AS r ON m.rack_id = r.rack_id
ORDER BY m.miner_id;

-- Exercise 3: find two unassigned miners (anti-join).
SELECT m.miner_id, m.model
FROM miners AS m
LEFT JOIN racks AS r ON m.rack_id = r.rack_id
WHERE r.rack_id IS NULL
ORDER BY m.miner_id;

-- Exercise 4: find empty racks, with COUNT of matching right-side IDs.
SELECT r.rack_name, COUNT(m.miner_id) AS miner_count
FROM racks AS r
LEFT JOIN miners AS m ON m.rack_id = r.rack_id
GROUP BY r.rack_id, r.rack_name
ORDER BY r.rack_id;

-- Exercise 5: ON preserves all miners, but matches only Hall 1 racks.
SELECT m.miner_id, r.rack_name
FROM miners AS m
LEFT JOIN racks AS r
    ON m.rack_id = r.rack_id AND r.location = 'Hall 1'
ORDER BY m.miner_id;

-- Exercise 6: WHERE removes non-Hall-1 and unassigned miners.
SELECT m.miner_id, r.rack_name
FROM miners AS m
LEFT JOIN racks AS r ON m.rack_id = r.rack_id
WHERE r.location = 'Hall 1'
ORDER BY m.miner_id;
