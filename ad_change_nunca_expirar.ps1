# Remove opção de trocar senha no próximo logon e definine para Nunca expirar.

Import-Module ActiveDirectory
Get-ADUser -Filter * -SearchBase "OU=" | Set-ADUser -ChangePasswordAtLogon $false –PasswordNeverExpires $true