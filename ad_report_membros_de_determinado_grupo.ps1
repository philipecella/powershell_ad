# Listar usuários dentro de um grupo.

Import-Module ActiveDirectory
start-transcript -path .\log.txt -Append
write-host NOME_DO_GRUPO
Get-ADGroupMember -identity “nome_do_grupo” -recursive | select name
stop-transcript