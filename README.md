# powershell-bg

bashで `a; b & c & d ; e` みたいのをPowershellでやるサンプル。

動作確認は
- Windows10上のPowershell 5,7
- Linux上のPowershell 7

`doit.sh` と `doit.ps1`を比較してみてください。

# 実行

## bash版

```sh
./init.sh ; ./doit.sh
```

## Powershell版

Windows上でPowershell 6以上の場合
```pwsh
pwsh .\init.ps1
pwsh .\doit.ps1
```

# 参考

- [Powershell equivalent of bash ampersand (&) for forking/running background processes - Stack Overflow](https://stackoverflow.com/questions/185575/powershell-equivalent-of-bash-ampersand-for-forking-running-background-proce)
- [Start\-Job \(Microsoft\.PowerShell\.Core\) \- PowerShell \| Microsoft Docs](https://docs.microsoft.com/en-us/powershell/module/Microsoft.PowerShell.Core/Start-Job?view=powershell-7.1)
- [Remove\-Job \(Microsoft\.PowerShell\.Core\) \- PowerShell \| Microsoft Docs](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/remove-job?view=powershell-7.1)
- [Job Control \(Bash Reference Manual\)](https://www.gnu.org/software/bash/manual/html_node/Job-Control.html#Job-Control)

# メモ

以下の2つはおなじ。
- `$job1 = Start-Job -ScriptBlock { Get-Content 3 }`
- `$job1 = & { Get-Content 3 } &`

上の方がStart-Jobのオプションつけられる利点が。

Receive-Jobで-Keepをつけなければ Remove-Job は不要。

Receive-Jobで-Nameじゃなくて-Jobにすれば $job.Nameはいらない(しかもデフォルトオプション)。以下の3つは同じ。
- `Receive-Job -Name $job1.Name`
- `Receive-Job -Job $job1`
- `Receive-Job $job1`
