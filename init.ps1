#!/usr/bin/env pwsh
foreach($i in 0..4){
    $i | Out-File $i
}
