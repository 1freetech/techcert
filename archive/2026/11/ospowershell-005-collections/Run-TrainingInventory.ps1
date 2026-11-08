# Open CERT / TechCert OSPowerShell.005 demonstration; read-only fictional data.
Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
Import-Module (Join-Path $PSScriptRoot 'InventoryLab.psm1') -Force
$devices = @(Get-TrainingInventory)
$rackCounts = [ordered]@{ 'Rack A' = 2; 'Rack B' = 1 }
$summary = Get-TrainingSummary -Devices $devices
$above = @(Get-TrainingAboveThreshold -Devices $devices -MinimumWatts 20)
'First device: {0}' -f $devices[0].Name
'Rack A count: {0}' -f $rackCounts['Rack A']
'Device count: {0}' -f $summary.DeviceCount
'Illustrative power sum: {0} W' -f $summary.TotalWatts
'At least 20 W: {0}' -f ($above.Name -join ', ')
