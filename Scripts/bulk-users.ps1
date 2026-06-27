Import-Module ActiveDirectory

$users = Import-Csv "C:\ADLab\users.csv"

foreach ($user in $users) {
	
	$password = ConvertTo-SecureString "P@ssw0rd123!" -AsPlainText -Force

	$ou = "OU=" + $user.OU + ",DC=residentevil,DC=local"

	New-ADUser -Name $user.Name `
		-SamAccountName $user.Username `
		-UserPrincipalName ($user.Username + "@residentevil.local") `
		-Path $ou `
		-AccountPassword $password `
		-Enabled $true
}