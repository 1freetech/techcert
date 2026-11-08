#!/usr/bin/env bash
# Open CERT / TechCert OSBash.006: Functions, arguments, local values, and return codes.
# Educational only: inputs are synthetic, and the script never touches devices.
set -u
set -o pipefail

usage() {
  printf 'Usage: bash device_report.sh DEVICE_LABEL WHOLE_WATTS\n' >&2
}

valid_label() {
  local label=${1-}
  [[ $label =~ ^[A-Za-z0-9._-]+$ ]] && (( ${#label} <= 32 ))
}

parse_watts() {
  local raw=${1-}
  # A length cap prevents accepting extremely large untrusted decimal strings.
  [[ $raw =~ ^[0-9]{1,4}$ ]] || return 3
  local watts=$((10#$raw))   # Prefix forces decimal even for 008 or 0007.
  (( watts <= 1000 )) || return 4
  printf '%d\n' "$watts"
}

report_device() {
  if (( $# != 2 )); then
    usage
    return 2
  fi
  local label=$1 raw_watts=$2 watts status
  if ! valid_label "$label"; then
    printf 'Invalid label: use 1-32 ASCII letters, digits, period, underscore, or hyphen.\n' >&2
    return 2
  fi
  if watts=$(parse_watts "$raw_watts"); then
    printf 'Device: %s\nPower (illustrative): %d W\n' "$label" "$watts"
  else
    status=$?
    if (( status == 3 )); then
      printf 'Invalid watts: supply 1-4 decimal digits.\n' >&2
    elif (( status == 4 )); then
      printf 'Out of range: the teaching limit is 1000 W.\n' >&2
    fi
    return "$status"
  fi
}

main() {
  report_device "$@"
}

if [[ ${BASH_SOURCE[0]} == "$0" ]]; then
  main "$@"
fi
