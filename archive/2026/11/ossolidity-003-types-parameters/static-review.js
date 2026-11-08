'use strict';
const fs = require('node:fs');
const assert = require('node:assert/strict');
const test = require('node:test');
const c = fs.readFileSync('ReadingBook.sol','utf8');
const t = fs.readFileSync('ReadingBookChecks.sol','utf8');
function balanced(code, left, right) {
  let nesting = 0;
  for (const ch of code) {
    if (ch === left) nesting++;
    if (ch === right) { nesting--; if (nesting < 0) return false; }
  }
  return nesting === 0;
}
test('Both files carry SPDX license markers', () => {for (const s of [c,t]) assert.match(s,/^\/\/ SPDX-License-Identifier: MIT/m);});
test('Both files pin released Solidity 0.8.38', () => {for (const s of [c,t]) assert.match(s,/pragma solidity 0\.8\.38;/);});
test('Source has a single named contract', () => assert.match(c,/contract ReadingBook \{/));
test('Import uses local repository path', () => assert.match(t,/import "\.\/ReadingBook\.sol";/));
test('Value types address, uint256 and bool are used', () => {for (const s of ['address public immutable','uint256 public lastWatts','bool public hasReading'])assert.ok(c.includes(s));});
test('Reference type string is used in storage and calldata', () => {assert.match(c,/string private _deviceLabel;/);assert.match(c,/string calldata nextLabel/);});
test('Constructor accepts memory input', () => assert.match(c,/constructor\(string memory initialLabel\)/));
test('Owner set from msg.sender', () => assert.match(c,/instructor = msg\.sender;/));
test('Mutation checks authorization', () => assert.match(c,/function record\(uint256 watts\) external \{[\s\S]*?msg\.sender != instructor/));
test('Mutation bounds watts', () => assert.match(c,/watts > TRAINING_LIMIT_WATTS/));
test('Reading state has explicit recorded flag', () => assert.match(c,/hasReading = true;/));
test('External getter is read-only', () => assert.match(c,/function summary\(\) external view returns/));
test('Pure calculation does not access mutable state', () => assert.match(c,/function twice\(uint256 watts\) external pure returns \(uint256\)/));
test('No payable code or ether transfers', () => assert.doesNotMatch(c,/\b(payable|transfer|send|selfdestruct|delegatecall)\b/));
test('No import outside local file path', () => assert.doesNotMatch(t,/import\s+"(https?:|@)/));
test('Brace counts balanced in both sources', () => {assert.ok(balanced(c,'{','}'));assert.ok(balanced(t,'{','}'));});
test('Seven isolated Remix VM checks are defined', () => assert.equal([...t.matchAll(/function check[A-Za-z]+\(\) external returns \(bool\)/g)].length,7));
test('Remix test harness includes failed-call assertions', () => {for (const f of ['checkUnauthorizedCaller','checkReadingLimit','checkEmptyConstructorLabel']) assert.ok(t.includes(f));});
