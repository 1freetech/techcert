#!/usr/bin/env bash
# Run OSC#.006 C# checks with .NET 10 SDK. No external packages.
set -euo pipefail
here="$(cd "$(dirname "$0")" && pwd)"
if ! command -v dotnet >/dev/null 2>&1; then
  printf 'ERROR: install .NET 10 SDK to execute the 18 checks.\n' >&2
  exit 127
fi
work="$(mktemp -d)"
trap 'rm -rf -- "$work"' EXIT
dotnet new console --framework net10.0 --output "$work/MethodLab" >/dev/null
cp "$here/33552-oscsharp-006-csharp-methods.cs" "$work/MethodLab/Program.cs"
actual="$(dotnet run --project "$work/MethodLab/MethodLab.csproj" --configuration Release)"
expected=$'18 method checks passed\ndevices: 3'
if [[ "$actual" != "$expected" ]]; then
  printf 'Unexpected output:\n%s\n' "$actual" >&2
  exit 1
fi
printf 'C# compilation and all 18 runtime checks passed.\n'
