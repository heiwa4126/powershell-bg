#!/usr/bin/env pwsh
Get-Content 4
# $job1 = Start-Job -ScriptBlock { Get-Content 3 }
$job1 = & { Get-Content 3 } &
$job2 = Start-Job -ScriptBlock { Get-Content 2 }
$job3 = Start-Job -ScriptBlock { Get-Content 1 }
Get-Job | Wait-Job | Out-Null
Receive-Job -Name $job1.Name -Keep
Receive-Job -Name $job2.Name -Keep
Receive-Job -Name $job3.Name -Keep
Get-Job | Remove-Job
Get-Content 0
