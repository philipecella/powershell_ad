# Adicionar email aos usuarios no AD

Import-Module ActiveDirectory
$users = Get-ADUser -Filter * -SearchBase "OU="
foreach ($user in $users)
{
$email = $user.samaccountname + '@dominio.com.br'
Set-ADUser -Identity $user.samaccountname -EmailAddress $email
}