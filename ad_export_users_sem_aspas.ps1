# Exportar Usuário para csv sem aspas
# Necessário alterar o -SearchBase para indicar de qual OU você deseja exportar lista de usuários e o out-file para nome do arquivo que deseja.
Import-Module ActiveDirectory
Get-ADUser -SearchBase "OU=" -Filter * -Properties * | Select-Object -Property SamAccountName | Sort-Object -Property SamAccountName | ConvertTo-Csv -NoTypeInformation | % { $_ -replace '"', ""} | out-file .\arquivo.csv
