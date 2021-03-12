#Linha de comando para criar OU em determinado local no AD.
Import-Module ActiveDirectory
New-ADOrganizationalUnit -Name ALTERAR -Path "OU=" -Description "ALTERAR" -PassThru