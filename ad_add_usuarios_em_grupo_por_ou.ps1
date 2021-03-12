# Adicionar usuários de uma determinada OU para um grupo

Import-Module ActiveDirectory
Get-ADUser -SearchBase 'OU=' -Filter * | % {Add-ADGroupMember 'g_wireless' -Members $_.DistinguishedName }