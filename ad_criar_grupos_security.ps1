# Criar security group por linha de comando

import-module ActiveDirectory
New-ADGroup -Name "1ad" -SamAccountName 1ad -GroupCategory Security -GroupScope Global -DisplayName "1ad" -Path "OU=" -Description "Usuarios do 1ad"