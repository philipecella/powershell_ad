start-transcript -path .\LOG.txt -Append

Get-Content ".\ad_criar_usuarios_em_massa.csv" | Set-Content ".\ad_criar_usuarios_em_massa.csv" -Encoding utf8


Import-Module ActiveDirectory
$Users = Import-Csv -Path ".\ad_criar_usuarios_em_massa.csv"
foreach ($User in $Users)            
{
	#Vars CSV
    $Displayname 	= $User.DisplayName
    $FullName		= $User.Firstname + " " + $User.Lastname            
    $UserFirstname 	= $User.Firstname            
    $UserLastname 	= $User.Lastname
    $OU 			= $User.OU
	$Description 	= $User.Description
	$Password 		= $User.Password
	$caminho 		= Get-ADOrganizationalUnit -filter "OU -eq '$OU'"
	$caminhopath 	= $caminho.DistinguishedName    
	
    
	#Usuario
	$SAM 			= $User.Firstname + "." + $User.Lastname            
	$SAMFiltered 		= Get-ADUser -filter "sAMAccountName -eq '$SAM'"
    $UPN 			= $SAM.toLower() + "@" + $User.Maildomain 
    $MAIL 			= $SAM.toLower() + "@" + $User.Mail 
    $Profile 			= "\\caminho_da_rede\perfil"

    
	#Verificar se ja esta cadastrado
	if($SAMFiltered -eq $null){
		New-ADUser -Name "$Displayname" -DisplayName "$Displayname" -SamAccountName "$SAM" -UserPrincipalName "$UPN" -EmailAddress "$mail" -GivenName "$UserFirstname" -Surname "$UserLastname" -Description "$Description" -AccountPassword (ConvertTo-SecureString $Password -AsPlainText -Force) -Enabled $true -Path "$caminhopath" -ChangePasswordAtLogon $true –PasswordNeverExpires $false -ProfilePath "$Profile" -server dominio            
	}
	else{
		echo "USUARIO JA CADASTRADO ---- $SAM"
	}
}
stop-transcript