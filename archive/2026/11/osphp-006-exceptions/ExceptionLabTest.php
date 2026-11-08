<?php
declare(strict_types=1);
require_once __DIR__ . '/ExceptionLab.php';
$passed = 0;
function check(string $name, bool $correct): void {
    global $passed;
    if (!$correct) {
        throw new RuntimeException('FAIL: ' . $name);
    }
    $passed++;
}
function throwsClass(callable $fn, string $class): bool {
    try {
        $fn();
    } catch (Throwable $error) {
        return $error instanceof $class;
    }
    return false;
}
check('integer', parseWattReading('120') === 120.0);
check('decimal', parseWattReading('35.50') === 35.5);
check('trim whitespace', parseWattReading(' 12.5 ') === 12.5);
check('zero permitted', parseWattReading('0') === 0.0);
check('max boundary', parseWattReading('1000.00') === 1000.0);
check('custom limit', parseWattReading('4.5', 5.0) === 4.5);
check('reject blank', throwsClass(fn()=>parseWattReading(''), InvalidArgumentException::class));
check('reject letters', throwsClass(fn()=>parseWattReading('oops'), InvalidArgumentException::class));
check('reject negative', throwsClass(fn()=>parseWattReading('-1'), InvalidArgumentException::class));
check('reject plus sign', throwsClass(fn()=>parseWattReading('+1'), InvalidArgumentException::class));
check('reject exponent', throwsClass(fn()=>parseWattReading('1e3'), InvalidArgumentException::class));
check('reject comma', throwsClass(fn()=>parseWattReading('1,000'), InvalidArgumentException::class));
check('reject three decimals', throwsClass(fn()=>parseWattReading('1.234'), InvalidArgumentException::class));
check('reject leading zeroes', throwsClass(fn()=>parseWattReading('001'), InvalidArgumentException::class));
check('reject over limit', throwsClass(fn()=>parseWattReading('1000.01'), DomainException::class));
check('reject nonpositive limit', throwsClass(fn()=>parseWattReading('1', 0.0), InvalidArgumentException::class));
check('reject infinite limit', throwsClass(fn()=>parseWattReading('1', INF), InvalidArgumentException::class));
check('reject long input', throwsClass(fn()=>parseWattReading(str_repeat('9', 30)), InvalidArgumentException::class));
check('strict PHP type enforcement', throwsClass(fn()=>parseWattReading(2), TypeError::class));
$sample = summarizeReadings(['120','35.50','oops','1200','0']);
check('counts accepted', $sample['accepted'] === 3);
check('counts rejected', $sample['rejected'] === 2);
check('counts processed finally', $sample['processed'] === 5);
check('sums valid watts', $sample['totalWatts'] === 155.5);
check('records decision order', $sample['decisions'] === ['accepted','accepted','rejected','rejected','accepted']);
check('empty input', summarizeReadings([])['processed'] === 0);
check('invalid array type not silently swallowed', throwsClass(fn()=>summarizeReadings([null]), TypeError::class));
check('large array capped', throwsClass(fn()=>summarizeReadings(array_fill(0,10001,'1')), LengthException::class));
check('finally success', illustrateFinally(false) === ['try','success','finally']);
check('finally error', illustrateFinally(true) === ['try','catch','finally']);
check('invalid max propagated when no matching catch', throwsClass(fn()=>summarizeReadings(['1'], 0.0), InvalidArgumentException::class) === true);
echo 'PASS: ' . $passed . ' checks' . PHP_EOL;
