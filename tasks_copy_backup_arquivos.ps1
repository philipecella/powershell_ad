# define arquivo de log
$RobocopyLog = "C:\diretorio\log\arquivo.log"
If (Test-Path -Path $RobocopyLog) {
	Remove-Item -Path $RobocopyLog -Force
}
# origem e destino
robocopy.exe "F:\origem\Logs" "G:\destino\Logs" /E /r:0 /np /nfl /ndl /Log+:$RobocopyLog

# email smtp
$body = Get-Content $RobocopyLog | Out-String
Send-MailMessage -From email@email.com -To email@email.com -Subject "Título do email" -body $body -SmtpServer ip_smtp