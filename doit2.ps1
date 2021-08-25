#!/usr/bin/env pwsh
Get-Content 4
$job1 = & { Get-Content 3 } &
$job2 = & { Get-Content 2 } &
$job3 = & { Get-Content 1 } &
Get-Job | Wait-Job | Out-Null
Receive-Job $job1
Receive-Job $job2
Receive-Job $job3
Get-Content 0
