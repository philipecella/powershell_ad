# Mover usuarios com base do campo description contido em csv.

start-transcript -path .\LOG.txt -Append
Import-Module ActiveDirectory
$students 	= Import-Csv .\alunos.csv

echo "--- MOVENDO MEMBROS"
foreach ($student in $students) {
	#Vars
	$description = $student.description
	$name = $student.name


	#Filters
	$filter = "description -eq '$description'"
	$studentFiltered = get-aduser -filter $filter


	#Get properties of filters
	$accountName = 	$studentFiltered.samAccountName
	

	#Execution
	echo "Movendo $description - $accountName"
	$studentFiltered | Set-ADUser -department "$name" 	
	$studentFiltered | move-adobject -targetpath (Get-ADOrganizationalUnit -filter "name -eq '$name'")	
	$studentFiltered | % {Add-ADGroupMember $name $accountName}
}
stop-transcript