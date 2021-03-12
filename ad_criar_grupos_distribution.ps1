# Criar distributiongroup por linha de comando
import-module ActiveDirectory
New-ADGroup -Name "1ad" -SamAccountName 1ad -GroupCategory Distribution -GroupScope Global -DisplayName "1ad" -Path "OU=" -Description "Usuarios do 1ad" -OtherAttributes @{'mail'="1ad@dominio.com.br"}