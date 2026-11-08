# Self-contained executable PowerShell test harness; requires PowerShell 7.
# These tests must be run with pwsh; they are not an external security audit.
Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
Import-Module (Join-Path $PSScriptRoot 'InventoryLab.psm1') -Force
$script:Checks = 0

function Assert-Equal {
    param([object] $Actual, [object] $Expected, [string] $Label)
    if ($Actual -cne $Expected) { throw "FAIL $Label : expected <$Expected>, got <$Actual>" }
    $script:Checks++
}
function Assert-Throws {
    param([scriptblock] $Action, [string] $Label)
    $threw = $false
    try { & $Action | Out-Null } catch { $threw = $true }
    if (-not $threw) { throw "FAIL $Label : expected an error" }
    $script:Checks++
}

$devices = @(Get-TrainingInventory)
$sum = Get-TrainingSummary -Devices $devices
$large = @(Get-TrainingAboveThreshold -Devices $devices -MinimumWatts 20)
$rack = [ordered]@{ 'Rack A' = 2; 'Rack B' = 1 }

Assert-Equal $devices.Count 3 'array count'
Assert-Equal $devices[0].Name 'router-a' 'first item'
Assert-Equal $devices[1].Name 'switch-b' 'second item'
Assert-Equal $devices[2].Name 'server-c' 'third item'
Assert-Equal $devices[-1].Name 'server-c' 'negative last index'
Assert-Equal $devices[0].Rack 'Rack A' 'first rack'
Assert-Equal $devices[2].Rack 'Rack B' 'last rack'
Assert-Equal $devices[0].PowerWatts 12 'first watt reading'
Assert-Equal $devices[1].PowerWatts 24 'second watt reading'
Assert-Equal $devices[2].PowerWatts 150 'third watt reading'
Assert-Equal $sum.DeviceCount 3 'summary device count'
Assert-Equal $sum.TotalWatts 186 'summary watt sum'
Assert-Equal $large.Count 2 'filtered count'
Assert-Equal $large[0].Name 'switch-b' 'filtered first'
Assert-Equal $large[1].Name 'server-c' 'filtered last'
Assert-Equal $rack['Rack A'] 2 'hashtable first key'
Assert-Equal $rack['Rack B'] 1 'hashtable second key'
Assert-Equal $rack.Count 2 'hashtable count'
Assert-Equal (($rack.Keys -join ', ')) 'Rack A, Rack B' 'ordered hashtable keys'
Assert-Equal (@($devices | Where-Object { $_.Rack -eq 'Rack A' }).Count) 2 'where-object filter'
Assert-Equal ($devices.Name -contains 'router-a') $true 'containment'
Assert-Equal (@(Get-TrainingAboveThreshold -Devices $devices -MinimumWatts 151).Count) 0 'empty filter'
Assert-Equal (@(Get-TrainingAboveThreshold -Devices $devices -MinimumWatts 0).Count) 3 'zero threshold'
Assert-Throws { Get-TrainingSummary -Devices @([pscustomobject]@{ Name='incomplete' }) } 'missing watt field'
Assert-Throws { Get-TrainingSummary -Devices @([pscustomobject]@{ PowerWatts=-1 }) } 'negative watt reading'
Assert-Throws { Get-TrainingSummary -Devices @([pscustomobject]@{ PowerWatts='12' }) } 'text watt reading'
Assert-Throws { Get-TrainingAboveThreshold -Devices $devices -MinimumWatts -1 } 'negative threshold'
Assert-Equal $sum.TotalWatts 186 'summary did not mutate source'
'PASS: {0} PowerShell assertions' -f $script:Checks
