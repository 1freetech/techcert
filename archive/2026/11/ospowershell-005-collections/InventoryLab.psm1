# Open CERT / TechCert OSPowerShell.005 — Collections training module.
# Fictional device names and power readings. No system changes or remote calls.
Set-StrictMode -Version Latest

function Get-TrainingInventory {
    [CmdletBinding()]
    param()
    [pscustomobject]@{ Name = 'router-a'; Rack = 'Rack A'; PowerWatts = 12 }
    [pscustomobject]@{ Name = 'switch-b'; Rack = 'Rack A'; PowerWatts = 24 }
    [pscustomobject]@{ Name = 'server-c'; Rack = 'Rack B'; PowerWatts = 150 }
}

function Get-TrainingSummary {
    [CmdletBinding()]
    param([Parameter(Mandatory)][object[]] $Devices)
    [long] $total = 0
    foreach ($device in $Devices) {
        if ($null -eq $device -or $null -eq $device.PSObject.Properties['PowerWatts']) {
            throw 'Every training record must have PowerWatts.'
        }
        if ($device.PowerWatts -isnot [int] -and $device.PowerWatts -isnot [long]) {
            throw 'PowerWatts must be an integer in this exercise.'
        }
        if ($device.PowerWatts -lt 0) {
            throw 'A training power reading cannot be negative.'
        }
        $total += [long] $device.PowerWatts
    }
    [pscustomobject]@{ DeviceCount = $Devices.Count; TotalWatts = $total }
}

function Get-TrainingAboveThreshold {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)][object[]] $Devices,
        [ValidateRange(0, 1000000)][long] $MinimumWatts = 20
    )
    foreach ($device in $Devices) {
        if ($null -eq $device -or $null -eq $device.PSObject.Properties['PowerWatts']) {
            throw 'Every training record must have PowerWatts.'
        }
        if ($device.PowerWatts -ge $MinimumWatts) {
            $device
        }
    }
}
Export-ModuleMember -Function Get-TrainingInventory, Get-TrainingSummary, Get-TrainingAboveThreshold
