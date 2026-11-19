#requires -Version 7.0
# OSPowerShell.006: read-only educational decision lab.
[CmdletBinding()]
param(
    [ValidateNotNullOrEmpty()]
    [string]$Status = 'Online',

    [ValidateRange(0, 1000)]
    [int]$Watts = 250,

    [switch]$AsJson
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$band = if ($Watts -ge 600) {
    'Review'
} elseif ($Watts -ge 300) {
    'Monitor'
} else {
    'Normal'
}

$action = switch ($Status) {
    'Online'      { 'Continue'; break }
    'Offline'     { 'Investigate'; break }
    'Maintenance' { 'Wait'; break }
    default       { 'Verify'; break }
}

$report = [pscustomobject][ordered]@{
    Status = $Status
    Watts = $Watts
    Band = $band
    Action = $action
    NeedsAttention = ($band -eq 'Review' -or $action -eq 'Investigate')
}

if ($AsJson) {
    $report | ConvertTo-Json -Depth 3
} else {
    $report
}
