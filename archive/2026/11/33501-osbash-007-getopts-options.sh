#!/usr/bin/env bash
# OSBash.007: safe CLI option parsing. No file changes or network access.
set -u

usage() {
  printf 'Usage: %s [-n 1-9] [-p prefix] [-v] [-h] -- device [device ...]\n' "${0##*/}"
}

limit=3
prefix=''
verbose=0
OPTIND=1
while getopts ':n:p:vh' option; do
  case $option in
    n)
      if [[ ! $OPTARG =~ ^[1-9]$ ]]; then
        printf 'Error: -n requires a digit from 1 to 9\n' >&2
        exit 2
      fi
      limit=$OPTARG
      ;;
    p) prefix=$OPTARG ;;
    v) verbose=1 ;;
    h) usage; exit 0 ;;
    :) printf 'Error: -%s needs a value\n' "$OPTARG" >&2; exit 2 ;;
    \?) printf 'Error: unknown option -%s\n' "$OPTARG" >&2; exit 2 ;;
  esac
done
shift "$((OPTIND - 1))"

if (( $# == 0 )); then
  printf 'Error: supply at least one device name\n' >&2
  usage >&2
  exit 2
fi

if (( verbose )); then
  printf 'Selection limit: %s; supplied: %s\n' "$limit" "$#" >&2
fi

printed=0
for device in "$@"; do
  (( printed < limit )) || break
  printf '%s%s\n' "$prefix" "$device"
  ((printed += 1))
done
