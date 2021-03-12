# Consultar quem está com o campo Description em branco no AD.

Import-Module ActiveDirectory
Get-AdUser -Filter {(Enabled -eq "True" ) -and (description -notlike '*')} -Properties Description''