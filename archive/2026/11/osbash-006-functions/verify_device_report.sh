#!/usr/bin/env bash
# Reproducible, non-destructive test suite: Bash builtins and a fresh Bash process.
set -u
set -o pipefail
SCRIPT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)/device_report.sh"
checks=0
check_case() {
  local name=$1 expected_status=$2 expected_fragment=$3
  shift 3
  local output status
  if output=$(bash "$SCRIPT" "$@" 2>&1); then
    status=0
  else
    status=$?
  fi
  if [[ $status -ne $expected_status || $output != *"$expected_fragment"* ]]; then
    printf 'FAIL %s: expected status %s and fragment %q, got status %s and text %q\n' \
      "$name" "$expected_status" "$expected_fragment" "$status" "$output" >&2
    return 1
  fi
  checks=$((checks + 1))
}

check_case normal 0 'Power (illustrative): 150 W' miner-01 150
check_case zero 0 'Power (illustrative): 0 W' miner_1 0
check_case maximum 0 'Power (illustrative): 1000 W' alpha.2 1000
check_case leading_zero 0 'Power (illustrative): 8 W' A 0008
check_case all_zero 0 'Power (illustrative): 0 W' A 0000
check_case decimal_100 0 'Power (illustrative): 100 W' A 0100
check_case three_digits 0 'Power (illustrative): 999 W' A 999
check_case decimal_one 0 'Power (illustrative): 1 W' A 0001
check_case over_limit 4 'Out of range' A 1001
check_case max_4_digits 4 'Out of range' A 9999
check_case negative 3 'Invalid watts' A -2
check_case fractional 3 'Invalid watts' A 1.5
check_case exponent 3 'Invalid watts' A 1e3
check_case plus_sign 3 'Invalid watts' A +1
check_case leading_space 3 'Invalid watts' A ' 1'
check_case too_many_digits 3 'Invalid watts' A 00001
check_case nonnumeric 3 'Invalid watts' A abc
check_case spaced_label 2 'Invalid label' 'bad space' 15
check_case blank_label 2 'Invalid label' '' 1
check_case slash_label 2 'Invalid label' 'x/y' 1
check_case long_label 2 'Invalid label' 'abcdefghijklmnopqrstuvwxyz1234567' 1
check_case missing_argument 2 'Usage:' A
check_case excess_arguments 2 'Usage:' A 1 extra
check_case no_arguments 2 'Usage:'
check_case literal_command_substitution 3 'Invalid watts' A '$(echo INJECTED)'
check_case semicolon_label 2 'Invalid label' 'A;date' 1
# Source safety: sourced Bash function definitions must not execute main.
if output=$(bash -c 'source "$1"; printf "sourced-ok"' bash "$SCRIPT" 2>&1); then
  [[ $output == 'sourced-ok' ]] || { printf 'FAIL sourced definitions\n' >&2; exit 1; }
  checks=$((checks + 1))
else
  printf 'FAIL sourcing definitions\n' >&2; exit 1
fi
printf 'PASS: %d checks\n' "$checks"
