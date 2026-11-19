#requires -Version 7.0
# Reader-run test suite. No PowerShell runtime was available during publication.
Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
$target = Join-Path $PSScriptRoot '33529-ospowershell-006-conditionals.ps1'
$pwsh = (Get-Command pwsh -ErrorAction Stop).Source
$tokens = $null
$errors = $null
[System.Management.Automation.Language.Parser]::ParseFile(
    $target, [ref]$tokens, [ref]$errors
) | Out-Null
if ($errors.Count -ne 0) {
    throw "PowerShell parsing failed with $($errors.Count) errors"
}

$cases = @(
    @{ Status='Online';      Watts=0;    Band='Normal';  Action='Continue';    Attention=$false }
    @{ Status='online';      Watts=299;  Band='Normal';  Action='Continue';    Attention=$false }
    @{ Status='Online';      Watts=300;  Band='Monitor'; Action='Continue';    Attention=$false }
    @{ Status='Online';      Watts=599;  Band='Monitor'; Action='Continue';    Attention=$false }
    @{ Status='Online';      Watts=600;  Band='Review';  Action='Continue';    Attention=$true  }
    @{ Status='Online';      Watts=1000; Band='Review';  Action='Continue';    Attention=$true  }
    @{ Status='Offline';     Watts=250;  Band='Normal';  Action='Investigate'; Attention=$true  }
    @{ Status='offline';     Watts=650;  Band='Review';  Action='Investigate'; Attention=$true  }
    @{ Status='Maintenance'; Watts=350;  Band='Monitor'; Action='Wait';        Attention=$false }
    @{ Status='Other';       Watts=100;  Band='Normal';  Action='Verify';      Attention=$false }
)
$checks = 0
foreach ($case in $cases) {
    $json = (& $pwsh -NoProfile -File $target -Status $case.Status -Watts $case.Watts -AsJson | Out-String)
    if ($LASTEXITCODE -ne 0) { throw "Command failed for $($case.Status) / $($case.Watts)" }
    $actual = $json | ConvertFrom-Json
    $expected = [ordered]@{
        Status = $case.Status
        Watts = $case.Watts
        Band = $case.Band
        Action = $case.Action
        NeedsAttention = $case.Attention
    }
    foreach ($property in $expected.Keys) {
        $got = $actual.PSObject.Properties[$property].Value
        if ($got -cne $expected[$property]) {
            throw "Assertion failed: $($case.Status) / $($case.Watts), $($property): got $got"
        }
        $checks++
    }
}
Write-Output "$checks PowerShell runtime field checks passed across $($cases.Count) scenarios"
