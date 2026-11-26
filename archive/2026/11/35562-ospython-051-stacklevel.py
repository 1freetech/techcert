import logging
import unittest

logger = logging.getLogger('lesson.caller')

def plain(message, *args):
    logger.info(message, *args)

def event(message, *args, stacklevel=1):
    logger.info(message, *args, stacklevel=stacklevel + 1)

def report(device):
    event('Device %s ready', device, stacklevel=2)

def check_device():
    plain('Device %s ready', 'lab-01')
    event('Device %s ready', 'lab-01')
    report('lab-01')

class CallerTest(unittest.TestCase):
    def test_attribution(self):
        with self.assertLogs(logger, level='INFO') as captured:
            check_device()
        self.assertEqual([r.funcName for r in captured.records],
                         ['plain', 'check_device', 'check_device'])
        self.assertEqual([r.getMessage() for r in captured.records],
                         ['Device lab-01 ready'] * 3)
        self.assertEqual(len({r.lineno for r in captured.records}), 3)

if __name__ == '__main__':
    unittest.main()
