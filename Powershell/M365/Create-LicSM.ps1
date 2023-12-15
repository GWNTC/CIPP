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
	Connect-MgGraph -Scopes "Domain.Read.All"
	$CLIENTDOMAIN = (Get-MgDomain | Where-Object {$_.isDefault}).Id
	if ($CLIENTDOMAIN -eq 'abcbuslines.com')
	{ $CLIENTCODE = 'ABC'}
	if ($CLIENTDOMAIN -eq 'cmhact.ca')
	{ $CLIENTCODE = 'CMHA'}
	if ($CLIENTDOMAIN -eq 'mcgclp.ca')
	{ $CLIENTCODE = 'MCGCLP'}
	if ($CLIENTDOMAIN -eq 'dcsjv.ca')
	{ $CLIENTCODE = 'MCGCLP'}
	if ($CLIENTDOMAIN -eq 'cochraneair.ca')
	{ $CLIENTCODE = 'MCGCLP'}
	if ($CLIENTDOMAIN -eq 'mbdc.co')
	{ $CLIENTCODE = 'MCGCLP'}
	if ($CLIENTDOMAIN -eq 'super8mris.ca')
	{ $CLIENTCODE = 'MCGCLP'}
	if ($CLIENTDOMAIN -eq 'complexre.ca')
	{ $CLIENTCODE = 'MCGCLP'}
	if ($CLIENTDOMAIN -eq 'actiontimmins.com')
	{ $CLIENTCODE = 'ARE'}
	if ($CLIENTDOMAIN -eq 'advancedprinters.ca')
	{ $CLIENTCODE = 'PAL'}
	if ($CLIENTDOMAIN -eq 'aicap.ca')
	{ $CLIENTCODE = 'AIC'}
	if ($CLIENTDOMAIN -eq 'macintyremining.com')
	{ $CLIENTCODE = 'AMAL'}
	if ($CLIENTDOMAIN -eq 'Aqsarniithotel.ca')
	{ $CLIENTCODE = 'AHCCI'}
	if ($CLIENTDOMAIN -eq 'arctickingdom.com')
	{ $CLIENTCODE = 'AK'}
	if ($CLIENTDOMAIN -eq 'bhfn.ca')
	{ $CLIENTCODE = 'BHFN'}
	if ($CLIENTDOMAIN -eq 'Bzenvironmental.com')
	{ $CLIENTCODE = 'BZ'}
	if ($CLIENTDOMAIN -eq 'canadanickel.com')
	{ $CLIENTCODE = 'CNC'}
	if ($CLIENTDOMAIN -eq 'lifessacredjourney.ca')
	{ $CLIENTCODE = 'LSJ'}
	if ($CLIENTDOMAIN -eq 'chapleaucree.ca')
	{ $CLIENTCODE = 'CCFN'}
	if ($CLIENTDOMAIN -eq 'conselectric.com')
	{ $CLIENTCODE = 'CECL'}
	if ($CLIENTDOMAIN -eq 'csrt.com')
	{ $CLIENTCODE = 'CSRT'}
	if ($CLIENTDOMAIN -eq 'dampc.ca')
	{ $CLIENTCODE = 'DAMPC'}
	if ($CLIENTDOMAIN -eq 'dumoulintrucking.ca')
	{ $CLIENTCODE = 'DT'}
	if ($CLIENTDOMAIN -eq 'eastendconstruction.ca')
	{ $CLIENTCODE = 'EEC'}
	if ($CLIENTDOMAIN -eq 'energymizers.com')
	{ $CLIENTCODE = 'EMI'}
	if ($CLIENTDOMAIN -eq 'goldbelttire.com')
	{ $CLIENTCODE = 'GTS'}
	if ($CLIENTDOMAIN -eq 'gowestgold.com')
	{ $CLIENTCODE = 'GGL'}
	if ($CLIENTDOMAIN -eq 'grbelanger.com')
	{ $CLIENTCODE = 'GRB'}
	if ($CLIENTDOMAIN -eq 'carabellemotel.com')
	{ $CLIENTCODE = 'GRB'}
	if ($CLIENTDOMAIN -eq 'kapsuper8.onmicrosoft.com')
	{ $CLIENTCODE = 'S8K'}
	if ($CLIENTDOMAIN -eq 'kapsuper8.ca')
	{ $CLIENTCODE = 'S8K'}
	if ($CLIENTDOMAIN -eq 'super8kapuskasing.com')
	{ $CLIENTCODE = 'S8K'}
	if ($CLIENTDOMAIN -eq 'kivalliqinuit.ca')
	{ $CLIENTCODE = 'KIA'}
	if ($CLIENTDOMAIN -eq 'ml-law.ca')
	{ $CLIENTCODE = 'MA'}
	if ($CLIENTDOMAIN -eq 'makonsag.ca')
	{ $CLIENTCODE = 'MAHSI'}
	if ($CLIENTDOMAIN -eq 'moosecree.com')
	{ $CLIENTCODE = 'MCFN'}
	if ($CLIENTDOMAIN -eq 'mcteu.ca')
	{ $CLIENTCODE = 'MCTEU'}
	if ($CLIENTDOMAIN -eq 'mvdf.ca')
	{ $CLIENTCODE = 'MVDF'}
	if ($CLIENTDOMAIN -eq 'mfnrez.ca')
	{ $CLIENTCODE = 'MATFN'}
	if ($CLIENTDOMAIN -eq 'monetagold.com')
	{ $CLIENTCODE = 'MPMI'}
	if ($CLIENTDOMAIN -eq 'monetaporcupine.com')
	{ $CLIENTCODE = 'MPMI'}
	if ($CLIENTDOMAIN -eq 'sakkuenterprises.net')
	{ $CLIENTCODE = 'SEL'}
	if ($CLIENTDOMAIN -eq 'mtenterprises.ca')
	{ $CLIENTCODE = 'SEL'}
	if ($CLIENTDOMAIN -eq 'nccig.ca')
	{ $CLIENTCODE = 'NCC'}
	if ($CLIENTDOMAIN -eq 'nfmtc.ca')
	{ $CLIENTCODE = 'NFTC'}
	if ($CLIENTDOMAIN -eq 'niiwin.com')
	{ $CLIENTCODE = 'NINC'}
	if ($CLIENTDOMAIN -eq 'north35.ca')
	{ $CLIENTCODE = 'N35CP'}
	if ($CLIENTDOMAIN -eq 'northwoodhotel.com')
	{ $CLIENTCODE = 'BWPNH'}
	if ($CLIENTDOMAIN -eq 'nunasi.com')
	{ $CLIENTCODE = 'NC'}
	if ($CLIENTDOMAIN -eq 'paib.ca')
	{ $CLIENTCODE = 'PAIB'}
	if ($CLIENTDOMAIN -eq 'vhinsurance.ca')
	{ $CLIENTCODE = 'PAIB'}
	if ($CLIENTDOMAIN -eq 'lawbarrister.com')
	{ $CLIENTCODE = 'JPDBS'}
	if ($CLIENTDOMAIN -eq 'sakku.ca')
	{ $CLIENTCODE = 'SIC'}
	if ($CLIENTDOMAIN -eq 'sakkuproperties.net')
	{ $CLIENTCODE = 'SIC'}
	if ($CLIENTDOMAIN -eq 'nukik.ca')
	{ $CLIENTCODE = 'SIC'}
	if ($CLIENTDOMAIN -eq 'frigidrentals.com')
	{ $CLIENTCODE = 'FRI'}
	if ($CLIENTDOMAIN -eq 'groupetifgroup.com')
	{ $CLIENTCODE = 'FRI'}
	if ($CLIENTDOMAIN -eq 'timminschamber.on.com')
	{ $CLIENTCODE = 'TCOC'}
	if ($CLIENTDOMAIN -eq 'timminsnorthlandmonuments.com')
	{ $CLIENTCODE = 'TNM'}
	if ($CLIENTDOMAIN -eq 'timminstablet.com')
	{ $CLIENTCODE = 'TT'}
	if ($CLIENTDOMAIN -eq 'tndgp.ca')
	{ $CLIENTCODE = 'TNDGP'}
	if ($CLIENTDOMAIN -eq 'travelbos.ca')
	{ $CLIENTCODE = 'TPIUNKNOWN'}
	if ($CLIENTDOMAIN -eq 'viauplumbing.com')
	{ $CLIENTCODE = 'VPHI'}
	if ($CLIENTDOMAIN -eq 'wabun.on.ca')
	{ $CLIENTCODE = 'WTC'}
	if ($CLIENTDOMAIN -eq 'wahgoshigresources.com')
	{ $CLIENTCODE = 'WRI'}
	if ($CLIENTDOMAIN -eq 'wakenagun.ca')
	{ $CLIENTCODE = 'WCFDC'}
		#Check for Mailbox
		Write-host "Logging into portal for $($client.Name) with Client Code $($CLIENTCODE)
		$DelegatedOrgURL = "https://ps.outlook.com/powershell-liveid?DelegatedOrg=" + $ClientDomain.Name
		$ExchangeOnlineSession = New-PSSession -ConnectionUri $DelegatedOrgURL -Credential $credential -Authentication Basic -ConfigurationName Microsoft.Exchange -AllowRedirection
		Import-PSSession -Session $ExchangeOnlineSession -AllowClobber -DisableNameChecking
		New-Mailbox -Name "Licensing" –Shared
		#Need to figured out passing domain and client code#
		Set-Mailbox -Identity "UPN" -ForwardingAddress "clients+$($CLIENTCODE)@gwntc.com"
		Remove-PSSession $ExchangeOnlineSession
	}
}
