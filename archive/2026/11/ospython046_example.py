import io
import json
import logging
import re
import sys
import unittest
from datetime import datetime, timezone

class JsonFormatter(logging.Formatter):
    """One explicit, safe-by-default schema for newline-delimited JSON logs."""

    def format(self, record):
        event = {
            "timestamp": datetime.fromtimestamp(
                record.created, timezone.utc
            ).isoformat(timespec="milliseconds").replace("+00:00", "Z"),
            "level": record.levelname,
            "logger": record.name,
            "message": record.getMessage(),
            "request_id": getattr(record, "request_id", None),
        }
        if record.exc_info:
            event["exception_type"] = record.exc_info[0].__name__
        return json.dumps(event, ensure_ascii=False, allow_nan=False, separators=(",", ":"))


def build_logger(output):
    logger = logging.getLogger("course.json.046")
    logger.setLevel(logging.INFO)
    logger.propagate = False
    for old in logger.handlers[:]:
        logger.removeHandler(old)
        old.close()
    handler = logging.StreamHandler(output)
    handler.setFormatter(JsonFormatter())
    logger.addHandler(handler)
    return logger


class JsonLoggingTests(unittest.TestCase):
    def setUp(self):
        self.output = io.StringIO()
        self.logger = build_logger(self.output)

    def tearDown(self):
        for handler in self.logger.handlers[:]:
            self.logger.removeHandler(handler)
            handler.close()

    def parse_one(self):
        lines = self.output.getvalue().splitlines()
        self.assertEqual(1, len(lines))
        return json.loads(lines[0])

    def test_formatted_message_and_typed_fields(self):
        self.logger.info("rack=%s state=%s", "R7", "ok", extra={"request_id": "req-007"})
        item = self.parse_one()
        self.assertEqual(item["message"], "rack=R7 state=ok")
        self.assertEqual(item["request_id"], "req-007")
        self.assertEqual(item["level"], "INFO")
        self.assertEqual(item["logger"], "course.json.046")
        self.assertRegex(item["timestamp"], r"^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}\.\d{3}Z$")

    def test_unknown_extra_is_not_exported(self):
        self.logger.info("healthy", extra={"api_token": "do-not-export"})
        item = self.parse_one()
        self.assertNotIn("api_token", item)
        self.assertNotIn("do-not-export", self.output.getvalue())
        self.assertIsNone(item["request_id"])

    def test_newline_is_encoded_within_one_line(self):
        self.logger.warning("line1\nline2")
        item = self.parse_one()
        self.assertEqual(item["message"], "line1\nline2")

    def test_exception_exports_type_only(self):
        try:
            raise ValueError("sensitive detail")
        except ValueError:
            self.logger.exception("operation failed")
        item = self.parse_one()
        self.assertEqual(item["exception_type"], "ValueError")
        self.assertNotIn("sensitive detail", self.output.getvalue())


if __name__ == "__main__":
    if "--demo" in sys.argv:
        logger = build_logger(sys.stdout)
        logger.info("rack=%s state=%s", "R7", "ok", extra={"request_id": "req-007"})
    else:
        unittest.main(verbosity=2)
