"use strict";
const assert = require("node:assert/strict");
let checks = 0;
function check(actual, expected, label) {
  assert.deepEqual(actual, expected, label);
  checks += 1;
}

const readings = [12, 18, 21];
check(Array.isArray(readings), true, "array type");
check(readings.length, 3, "length");
check(readings[0], 12, "zero index");
check(readings.at(-1), 21, "last element");
check(readings[9], undefined, "missing index");

const newLength = readings.push(25);
check(newLength, 4, "push returns new length");
check(readings, [12, 18, 21, 25], "push changes original");
check(readings.pop(), 25, "pop returns final element");
check(readings.length, 3, "pop changes length");

const middle = readings.slice(1, 3);
check(middle, [18, 21], "slice returns half-open range");
check(readings, [12, 18, 21], "slice preserves source");
const removed = readings.splice(1, 1, 19);
check(removed, [18], "splice returns removed values");
check(readings, [12, 19, 21], "splice mutates source");

const alias = readings;
alias[0] = 15;
check(readings[0], 15, "assignment creates alias");
const snapshot = readings.slice();
snapshot[0] = 0;
check(readings[0], 15, "slice copies primitive elements");
check(snapshot, [0, 19, 21], "copy can be changed separately");

const objects = [{ count: 1 }];
const shallow = objects.slice();
shallow[0].count = 2;
check(objects[0].count, 2, "shallow copy shares nested object");

const sparse = [1, , 3];
check(sparse.length, 3, "sparse length includes hole");
check(1 in sparse, false, "hole is not an indexed property");
check(sparse[1], undefined, "reading hole produces undefined");
check(Array.of(3), [3], "Array.of creates one element");

console.log(checks + " array checks passed");
console.log("readings: " + readings.join(", "));