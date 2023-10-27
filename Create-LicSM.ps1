<#	
	.NOTES
	===========================================================================
	 Created on:   	2023-10-10 10:15 AM 
	 Created by:   	Justin Leroux
	 Organization: Great White North 	
	 Filename: CXreate-LicSM.ps	
	===========================================================================
	.DESCRIPTION
		This script will use the partner connect to go to each client and create the licensing mailbox
  NOT READY FOR PRODUCTION USE
  #>
$credential = Get-Credential
connect-msolservice -Credential $credential
$clients = Get-MsolPartnerContract -All
foreach ($client in $clients) {
    $ClientDomain = Get-MsolDomain -TenantId $client.TenantId | Where-Object {$_.IsInitial -eq $true}
	$CLIENTDOMAIN2 = (Get-MgDomain | Where-Object {$_.isDefault}).Id
    #Set CLient Code 
	if ($CLIENTDOMAIN2 -eq 'abcbuslines.com')
	{ $CLIENTCODE = 'ABC'}
	if ($CLIENTDOMAIN2 -eq 'example.com')
	{ $CLIENTCODE = 'EXMPL'}	
	Write-host "Logging into portal for $($client.Name) with Client Code $($CLIENTCODE)
    $DelegatedOrgURL = "https://ps.outlook.com/powershell-liveid?DelegatedOrg=" + $ClientDomain.Name
    $ExchangeOnlineSession = New-PSSession -ConnectionUri $DelegatedOrgURL -Credential $credential -Authentication Basic -ConfigurationName Microsoft.Exchange -AllowRedirection
    Import-PSSession -Session $ExchangeOnlineSession -AllowClobber -DisableNameChecking
    New-Mailbox -Name "Licensing" –Shared
	#Need to figured out passing domain and client code#
	Set-Mailbox -Identity "UPN" -ForwardingAddress "clients+$($CLIENTCODE)@gwntc.com"
    Remove-PSSession $ExchangeOnlineSession
}
