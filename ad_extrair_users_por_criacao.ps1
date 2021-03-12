# Exportar em csv lista de usuarios por data de criação, exemplo: 30 dias
$When = ((Get-Date).AddDays(-30)).Date
Get-ADUser -SearchBase "OU=" -Filter {whenCreated -ge $When} -Properties whenCreated, mail |
Select-Object -Property mail | 
Sort-Object -Property mail | 
ConvertTo-Csv -NoTypeInformation  | % { $_ -replace '"', ""} | 
out-file .\Lista.csv