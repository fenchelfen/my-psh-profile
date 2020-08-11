# setting 12th build tools envs

$vcvarspath="C:\Program Files (x86)\Microsoft Visual Studio 12.0"


cmd.exe /c "call `"$vcvarspath\VC\bin\amd64\vcvars64.bat`" && set > %temp%\vcvars.txt"

Get-Content "$env:temp\vcvars.txt" | Foreach-Object {
	if ($_ -match "^(.*?)=(.*)$") {
	  Set-Content "env:\$($matches[1])" $matches[2]
	}
}
