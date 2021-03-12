# Exporta lista de grupos do Member of de um usuário
Import-Module ActiveDirectory
(Get-ADUser nome.usuario -Properties MemberOf).MemberOf -split (",") | Select-String -AllMatches "CN="