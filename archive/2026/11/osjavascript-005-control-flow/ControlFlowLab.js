'use strict';

function classifyTemperature(value) {
  if (typeof value !== 'number' || !Number.isFinite(value)) {
    throw new TypeError('Temperature must be a finite number');
  }
  if (value >= 85) return 'ALERT';
  if (value >= 70) return 'WATCH';
  return 'NORMAL';
}

function priority(status) {
  switch (status) {
    case 'ALERT': return 3;
    case 'WATCH': return 2;
    case 'NORMAL': return 1;
    default: throw new RangeError('Unknown status');
  }
}

function scanSamples(samples) {
  if (!Array.isArray(samples)) throw new TypeError('Expected an array');
  let validCount = 0;
  let total = 0;
  let firstCritical = null;
  for (let index = 0; index < samples.length; index++) {
    const value = samples[index];
    if (typeof value !== 'number' || !Number.isFinite(value)) continue;
    validCount++;
    total += value;
    if (value >= 90) {
      firstCritical = { index, value };
      break;
    }
  }
  return { validCount, total, firstCritical };
}

function cappedAttempts(readyAfter, maxAttempts) {
  if (!Number.isInteger(readyAfter) || readyAfter < 1 ||
      !Number.isInteger(maxAttempts) || maxAttempts < 0) {
    throw new RangeError('Expected valid integer attempt limits');
  }
  let attempts = 0;
  while (attempts < maxAttempts) {
    attempts++;
    if (attempts >= readyAfter) break;
  }
  return attempts;
}

function atLeastOnce(limit) {
  if (!Number.isInteger(limit) || limit < 0) {
    throw new RangeError('Limit must be a nonnegative integer');
  }
  let attempts = 0;
  do {
    attempts++;
  } while (attempts < limit);
  return attempts;
}

function sumOdd(values) {
  if (!Array.isArray(values)) throw new TypeError('Expected an array');
  let sum = 0;
  for (const value of values) {
    if (!Number.isSafeInteger(value)) throw new TypeError('Expected safe integers');
    if (value % 2 === 0) continue;
    sum += value;
    if (!Number.isSafeInteger(sum)) throw new RangeError('Integer sum overflow');
  }
  return sum;
}

if (require.main === module) {
  console.log('85 C:', classifyTemperature(85));
  console.log('70 C:', classifyTemperature(70));
  console.log('55 C:', classifyTemperature(55));
  console.log('ALERT priority:', priority('ALERT'));
  console.log('Scan:', JSON.stringify(scanSamples([NaN, 70, 82, 94, 99])));
  console.log('Polls before ready:', cappedAttempts(2, 5));
  console.log('do...while with limit 0:', atLeastOnce(0));
  console.log('Sum of odd values:', sumOdd([2, 3, 4, 5]));
}

module.exports = {
  classifyTemperature, priority, scanSamples,
  cappedAttempts, atLeastOnce, sumOdd
};
