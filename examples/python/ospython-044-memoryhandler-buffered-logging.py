import io
import logging
from logging.handlers import MemoryHandler

output = io.StringIO()
destination = logging.StreamHandler(output)
destination.setFormatter(logging.Formatter("%(levelname)s %(message)s"))

logger = logging.getLogger("sensor.demo")
logger.setLevel(logging.DEBUG)
logger.propagate = False

buffer = MemoryHandler(
    capacity=5,
    flushLevel=logging.ERROR,
    target=destination,
    flushOnClose=False,
)
logger.addHandler(buffer)

logger.debug("Starting sensor read")
logger.info("Retrying connection")
print("Before:", repr(output.getvalue()))

logger.error("Sensor unavailable")
print("After:", repr(output.getvalue()))

logger.removeHandler(buffer)
buffer.close()
destination.close()
