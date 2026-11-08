"""OSSQL.006: 24 reproducible SQLite checks. Standard-library only."""
from pathlib import Path
import sqlite3
import unittest

SQL = Path(__file__).with_name("join_lab.sql").read_text(encoding="utf-8")

class JoinLabTests(unittest.TestCase):
    def setUp(self):
        self.db = sqlite3.connect(":memory:")
        self.db.execute("PRAGMA foreign_keys = ON")
        self.db.executescript(SQL)

    def tearDown(self):
        self.db.close()

    def rows(self, query, parameters=()):
        return self.db.execute(query, parameters).fetchall()

    def test_01_enforcement_enabled(self):
        self.assertEqual(self.rows("PRAGMA foreign_keys"), [(1,)])
    def test_02_four_racks(self):
        self.assertEqual(self.rows("SELECT COUNT(*) FROM racks"), [(4,)])
    def test_03_seven_miners(self):
        self.assertEqual(self.rows("SELECT COUNT(*) FROM miners"), [(7,)])
    def test_04_illustrative_labels(self):
        self.assertEqual(self.rows("SELECT model FROM miners WHERE miner_id=1001"), [("Training A",)])
    def test_05_nullable_foreign_key(self):
        self.assertEqual(self.rows("SELECT COUNT(*) FROM miners WHERE rack_id IS NULL"), [(2,)])
    def test_06_invalid_parent_blocked(self):
        with self.assertRaises(sqlite3.IntegrityError):
            self.db.execute("INSERT INTO miners VALUES (2000,'Training X',999,150)")
    def test_07_nonpositive_hashrate_blocked(self):
        with self.assertRaises(sqlite3.IntegrityError):
            self.db.execute("INSERT INTO miners VALUES (2000,'Training X',10,0)")
    def test_08_inner_count(self):
        self.assertEqual(self.rows("SELECT COUNT(*) FROM miners m JOIN racks r ON m.rack_id=r.rack_id"), [(5,)])
    def test_09_inner_ordered_ids(self):
        self.assertEqual(self.rows("SELECT m.miner_id FROM miners m JOIN racks r ON m.rack_id=r.rack_id ORDER BY m.miner_id"), [(1001,), (1002,), (1003,), (1005,), (1006,)])
    def test_10_inner_correct_rack_name(self):
        self.assertEqual(self.rows("SELECT r.rack_name FROM miners m JOIN racks r ON m.rack_id=r.rack_id WHERE m.miner_id=1003"), [("Rack B",)])
    def test_11_left_count(self):
        self.assertEqual(self.rows("SELECT COUNT(*) FROM miners m LEFT JOIN racks r ON m.rack_id=r.rack_id"), [(7,)])
    def test_12_unassigned_1004_preserved(self):
        self.assertEqual(self.rows("SELECT r.rack_name FROM miners m LEFT JOIN racks r ON m.rack_id=r.rack_id WHERE m.miner_id=1004"), [(None,)])
    def test_13_unassigned_1007_preserved(self):
        self.assertEqual(self.rows("SELECT r.rack_name FROM miners m LEFT JOIN racks r ON m.rack_id=r.rack_id WHERE m.miner_id=1007"), [(None,)])
    def test_14_null_is_not_empty_string(self):
        self.assertEqual(self.rows("SELECT COUNT(*) FROM miners m LEFT JOIN racks r ON m.rack_id=r.rack_id WHERE r.rack_name=''"), [(0,)])
    def test_15_anti_join_miner_ids(self):
        self.assertEqual(self.rows("SELECT m.miner_id FROM miners m LEFT JOIN racks r ON m.rack_id=r.rack_id WHERE r.rack_id IS NULL ORDER BY m.miner_id"), [(1004,), (1007,)])
    def test_16_empty_rack_found(self):
        self.assertEqual(self.rows("SELECT r.rack_id FROM racks r LEFT JOIN miners m ON r.rack_id=m.rack_id WHERE m.miner_id IS NULL"), [(40,)])
    def test_17_rack_counts(self):
        self.assertEqual(self.rows("SELECT r.rack_id,COUNT(m.miner_id) FROM racks r LEFT JOIN miners m ON r.rack_id=m.rack_id GROUP BY r.rack_id ORDER BY r.rack_id"), [(10,2),(20,1),(30,2),(40,0)])
    def test_18_count_star_differs_for_empty_rack(self):
        self.assertEqual(self.rows("SELECT COUNT(*),COUNT(m.miner_id) FROM racks r LEFT JOIN miners m ON r.rack_id=m.rack_id WHERE r.rack_id=40"), [(1,0)])
    def test_19_on_filter_preserves_left_rows(self):
        self.assertEqual(self.rows("SELECT COUNT(*) FROM miners m LEFT JOIN racks r ON m.rack_id=r.rack_id AND r.location='Hall 1'"), [(7,)])
    def test_20_where_filter_removes_unmatched(self):
        self.assertEqual(self.rows("SELECT COUNT(*) FROM miners m LEFT JOIN racks r ON m.rack_id=r.rack_id WHERE r.location='Hall 1'"), [(3,)])
    def test_21_on_filter_matching_ids(self):
        self.assertEqual(self.rows("SELECT m.miner_id FROM miners m LEFT JOIN racks r ON m.rack_id=r.rack_id AND r.location='Hall 1' WHERE r.rack_id IS NOT NULL ORDER BY m.miner_id"), [(1001,),(1002,),(1003,)])
    def test_22_join_multiplicity(self):
        self.assertEqual(self.rows("SELECT COUNT(*) FROM miners m JOIN racks r ON m.rack_id=r.rack_id WHERE r.rack_id=10"), [(2,)])
    def test_23_parameterized_location(self):
        self.assertEqual(self.rows("SELECT m.miner_id FROM miners m JOIN racks r ON m.rack_id=r.rack_id WHERE r.location=? ORDER BY m.miner_id", ('Hall 2',)), [(1005,), (1006,)])
    def test_24_explicit_order_consistency(self):
        self.assertEqual(self.rows("SELECT miner_id FROM miners ORDER BY miner_id LIMIT 3 OFFSET 2"), [(1003,), (1004,), (1005,)])

if __name__ == "__main__":
    unittest.main(verbosity=2)
