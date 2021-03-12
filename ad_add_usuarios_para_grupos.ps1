# Exporta usuários criados há 2 dias.

Import-Module ActiveDirectory
$When = ((Get-Date).AddDays(-2)).Date
Get-ADUser -SearchBase "OU=posgraduacao,OU=ALUNOS,OU=arkansas,DC=direitosbc,DC=br" -Filter {whenCreated -ge $When} -Properties * | Select-Object -Property samaccountname | Sort-Object -Property samaccountname | 
Export-Csv .\userList.csv -NoTypeInformation

######################
# Importa lista de usuarios criados há 2 dias e adiciona nos grupos

$List = Import-CSV C:\Script\scripts_AD_powershell\adicionar_grupos\userList.csv
ForEach ($User in $List)
{
Add-ADGroupMember -Identity NOME_GRUPO1 -Member $User.samaccountname
Add-ADGroupMember -Identity NOME_GRUPO2 -Member $User.samaccountname
}

# Envia email com nome dos usuarios criados há 2 dias

$body = Get-Content -Path .\userList.csv | Out-String 
Send-MailMessage -From email@email.com.br -To email@email.com.br -Subject "Usuarios Adicionados aos Grupos" -body "Usuarios" `n $body" -SmtpServer IP_SMTP
