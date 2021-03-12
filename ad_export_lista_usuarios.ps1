# Exporta listagem de usuarios de uma determinada OU com as informacoes de samaccount e email

Import-Module ActiveDirectory
Get-ADUser -SearchBase "OU=Usuarios,OU=Direitosbc,DC=direitosbc,DC=br" -Filter * -Properties * |  
Select-Object -Property SamAccountName, mail | 
Sort-Object -Property SamAccountName, mail | 
ConvertTo-Csv -NoTypeInformation | 
% { $_ -replace '"', ""} | 
out-file .\usuarios.csv