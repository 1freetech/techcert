"""Dependency-free Bash getopts regression test suite for OSBash.007."""
import subprocess
from pathlib import Path

SCRIPT = Path(__file__).with_suffix('.sh')
passed = 0

def check(label, args, status, stdout=None, stderr_contains=None):
    global passed
    result = subprocess.run(['bash', str(SCRIPT), *args], capture_output=True, text=True, check=False)
    assert result.returncode == status, f'{label}: code {result.returncode}; {result.stderr!r}'
    if stdout is not None:
        assert result.stdout == stdout, f'{label}: stdout {result.stdout!r}'
    if stderr_contains is not None:
        assert stderr_contains in result.stderr, f'{label}: stderr {result.stderr!r}'
    passed += 1

check('one operand', ['rack A'], 0, 'rack A\n')
check('default 3', ['a', 'b', 'c', 'd'], 0, 'a\nb\nc\n')
check('default exactly 3', ['a', 'b', 'c'], 0, 'a\nb\nc\n')
check('limit 1', ['-n', '1', '--', 'a', 'b'], 0, 'a\n')
check('limit 2', ['-n', '2', '--', 'a', 'b', 'c'], 0, 'a\nb\n')
check('limit 9', ['-n', '9', '--', 'a', 'b'], 0, 'a\nb\n')
check('limit zero', ['-n', '0', 'a'], 2, '', 'digit from 1 to 9')
check('limit 10', ['-n', '10', 'a'], 2, '', 'digit from 1 to 9')
check('limit letter', ['-n', 'q', 'a'], 2, '', 'digit from 1 to 9')
check('limit negative', ['-n', '-1', 'a'], 2, '', 'digit from 1 to 9')
check('limit empty', ['-n', '', 'a'], 2, '', 'digit from 1 to 9')
check('missing n value', ['-n'], 2, '', 'needs a value')
check('missing p value', ['-p'], 2, '', 'needs a value')
check('unknown flag', ['-z', 'a'], 2, '', 'unknown option')
check('long option is unsupported', ['--verbose', 'a'], 2, '', 'unknown option')
check('simple prefix', ['-p', 'lab: ', 'rack'], 0, 'lab: rack\n')
check('prefix with spaces', ['-p', 'data center ', 'rack A'], 0, 'data center rack A\n')
check('option bundles', ['-vn', '2', '--', 'x', 'y'], 0, 'x\ny\n', 'Selection limit: 2; supplied: 2')
check('verbose stderr', ['-v', '--', 'a'], 0, 'a\n', 'Selection limit: 3; supplied: 1')
check('help without operands', ['-h'], 0, None, None)
check('no operands', [], 2, '', 'supply at least one')
check('leading dash operand', ['--', '-rack'], 0, '-rack\n')
check('quoted with spaces', ['--', 'rack A', 'rack B'], 0, 'rack A\nrack B\n')
check('literal metacharacters', ['--', '$(touch /tmp/NONEXISTENT)', '; echo hacked'], 0, '$(touch /tmp/NONEXISTENT)\n; echo hacked\n')
check('empty operand', ['--', ''], 0, '\n')
check('multiline operand', ['--', 'line1\nline2'], 0, 'line1\nline2\n')
check('prefix beginning dash', ['-p', '-lab-', '--', 'x'], 0, '-lab-x\n')
check('double dash ends options', ['--', '-v', '-h'], 0, '-v\n-h\n')
check('first non-option stops options', ['a', '-v'], 0, 'a\n-v\n')
check('limit with prefix', ['-n', '1', '-p', 'lab ', '--', 'x', 'y'], 0, 'lab x\n')
syntax = subprocess.run(['bash', '-n', str(SCRIPT)], capture_output=True, text=True, check=False)
assert syntax.returncode == 0, syntax.stderr
passed += 1
print(f'{passed} Bash CLI parsing checks passed')
