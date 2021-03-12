# Adiciona usuários em um grupo que estão dentro de um .csv chamado group.csv, groupname e username
import-module activedirectory
import-csv "group.csv" | ForEach-Object {add-ADGroupMember -Identity $_.groupname -Members $_.username} 