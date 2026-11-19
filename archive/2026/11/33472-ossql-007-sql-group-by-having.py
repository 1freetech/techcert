"""Reproducible 28-check SQLite lab for BitcoinVersus.Tech OSSQL.007."""
import sqlite3
from pathlib import Path

con = sqlite3.connect(':memory:')
con.executescript(Path(__file__).with_suffix('.sql').read_text(encoding='utf-8'))

def one(sql):
    return con.execute(sql).fetchone()[0]

def rows(sql):
    return con.execute(sql).fetchall()

group = 'SELECT facility, COUNT(*), COUNT(watts), SUM(watts), ROUND(AVG(watts), 2) FROM equipment GROUP BY facility ORDER BY facility IS NULL, facility'
where = 'SELECT facility, COUNT(*), SUM(watts) FROM equipment WHERE watts >= 250 GROUP BY facility ORDER BY facility'
having = 'SELECT facility, COUNT(*), SUM(watts) FROM equipment WHERE facility IS NOT NULL GROUP BY facility HAVING SUM(watts) >= 1000 ORDER BY facility'
multi = 'SELECT facility, device_type, COUNT(*) FROM equipment WHERE facility IS NOT NULL GROUP BY facility, device_type ORDER BY facility, device_type'
all_groups = rows(group)
all_multi = rows(multi)
checks = [
 ('row count', one('SELECT COUNT(*) FROM equipment'), 12),
 ('known watts', one('SELECT COUNT(watts) FROM equipment'), 10),
 ('missing watts', one('SELECT COUNT(*)-COUNT(watts) FROM equipment'), 2),
 ('total watts', one('SELECT SUM(watts) FROM equipment'), 3300),
 ('average watts', one('SELECT AVG(watts) FROM equipment'), 330.0),
 ('distinct types', one('SELECT COUNT(DISTINCT device_type) FROM equipment'), 4),
 ('minimum watts', one('SELECT MIN(watts) FROM equipment'), 100),
 ('maximum watts', one('SELECT MAX(watts) FROM equipment'), 650),
 ('server watts', one("SELECT SUM(watts) FROM equipment WHERE device_type='Server'"), 2150),
 ('null watts', one('SELECT COUNT(*) FROM equipment WHERE watts IS NULL'), 2),
 ('null facilities', one('SELECT COUNT(*) FROM equipment WHERE facility IS NULL'), 1),
 ('group count', len(all_groups), 4),
 ('north group', all_groups[0], ('North',5,4,1600,400.0)),
 ('south group', all_groups[1], ('South',3,3,1000,333.33)),
 ('west group', all_groups[2], ('West',3,2,600,300.0)),
 ('null facility group', all_groups[3], (None,1,1,100,100.0)),
 ('WHERE group filtering', rows(where), [('North',3,1450),('South',2,880),('West',1,400)]),
 ('HAVING group filtering', rows(having), [('North',5,1600),('South',3,1000)]),
 ('groups of three rows', one('SELECT COUNT(*) FROM (SELECT facility FROM equipment GROUP BY facility HAVING COUNT(*) >= 3)'), 3),
 ('groups of three known watts', one('SELECT COUNT(*) FROM (SELECT facility FROM equipment GROUP BY facility HAVING COUNT(watts) >= 3)'), 2),
 ('two-column group count', len(all_multi), 8),
 ('north servers', ('North','Server',3) in all_multi, True),
 ('west servers', ('West','Server',2) in all_multi, True),
 ('north distinct device types', one("SELECT COUNT(DISTINCT device_type) FROM equipment WHERE facility='North'"), 3),
 ('empty SUM is NULL', one("SELECT SUM(watts) FROM equipment WHERE facility='Missing'"), None),
 ('empty total is zero', one("SELECT total(watts) FROM equipment WHERE facility='Missing'"), 0.0),
 ('empty AVG is NULL', one("SELECT AVG(watts) FROM equipment WHERE facility='Missing'"), None),
 ('empty COUNT is zero', one("SELECT COUNT(*) FROM equipment WHERE facility='Missing'"), 0),
]
for label, actual, expected in checks:
    assert actual == expected, f'{label}: {actual!r} != {expected!r}'
print(f'{len(checks)} SQLite aggregate checks passed on SQLite {sqlite3.sqlite_version}')
for facility, count, known, watts, avg in all_groups:
    print(f'{facility or "Unassigned"}: rows={count}, known={known}, watts={watts}, avg={avg:.2f}')
