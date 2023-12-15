<#
TO-DO
> Configure for Partner Shell Script with Foreach loop
> Verify Remaining Rule Sets
#>

#Requires -Modules Microsoft.Graph.Identity.SignIns, Microsoft.Graph.Users

$credential = Get-Credential
connect-msolservice -Credential $credential
$clients = Get-MsolPartnerContract -All
foreach ($client in $clients) {
    $ClientDomain = Get-MsolDomain -TenantId $client.TenantId | Where-Object {$_.IsInitial -eq $true}
    $CLIENTDOMAIN2 = (Get-MgDomain | Where-Object {$_.isDefault}).Id
    #Set CLient Code 
	Connect-MgGraph -Scopes "Domain.Read.All"
	$CLIENTDOMAIN2 = (Get-MgDomain | Where-Object {$_.isDefault}).Id
	if ($CLIENTDOMAIN -eq 'abcbuslines.com')
	{ $CLIENTCODE = 'ABC'}
	if ($CLIENTDOMAIN2 -eq 'cmhact.ca')
	{ $CLIENTCODE = 'CMHA'}
	if ($CLIENTDOMAIN2 -eq 'mcgclp.ca')
	{ $CLIENTCODE = 'MCGCLP'}
	if ($CLIENTDOMAIN2 -eq 'dcsjv.ca')
	{ $CLIENTCODE = 'MCGCLP'}
	if ($CLIENTDOMAIN2 -eq 'cochraneair.ca')
	{ $CLIENTCODE = 'MCGCLP'}
	if ($CLIENTDOMAIN2 -eq 'mbdc.co')
	{ $CLIENTCODE = 'MCGCLP'}
	if ($CLIENTDOMAIN2 -eq 'super8mris.ca')
	{ $CLIENTCODE = 'MCGCLP'}
	if ($CLIENTDOMAIN2 -eq 'complexre.ca')
	{ $CLIENTCODE = 'MCGCLP'}
	if ($CLIENTDOMAIN2 -eq 'actiontimmins.com')
	{ $CLIENTCODE = 'ARE'}
	if ($CLIENTDOMAIN2 -eq 'advancedprinters.ca')
	{ $CLIENTCODE = 'PAL'}
	if ($CLIENTDOMAIN2 -eq 'aicap.ca')
	{ $CLIENTCODE = 'AIC'}
	if ($CLIENTDOMAIN2 -eq 'macintyremining.com')
	{ $CLIENTCODE = 'AMAL'}
	if ($CLIENTDOMAIN2 -eq 'Aqsarniithotel.ca')
	{ $CLIENTCODE = 'AHCCI'}
	if ($CLIENTDOMAIN2 -eq 'arctickingdom.com')
	{ $CLIENTCODE = 'AK'}
	if ($CLIENTDOMAIN2 -eq 'bhfn.ca')
	{ $CLIENTCODE = 'BHFN'}
	if ($CLIENTDOMAIN2 -eq 'Bzenvironmental.com')
	{ $CLIENTCODE = 'BZ'}
	if ($CLIENTDOMAIN2 -eq 'canadanickel.com')
	{ $CLIENTCODE = 'CNC'}
	if ($CLIENTDOMAIN2 -eq 'lifessacredjourney.ca')
	{ $CLIENTCODE = 'LSJ'}
	if ($CLIENTDOMAIN2 -eq 'chapleaucree.ca')
	{ $CLIENTCODE = 'CCFN'}
	if ($CLIENTDOMAIN2 -eq 'conselectric.com')
	{ $CLIENTCODE = 'CECL'}
	if ($CLIENTDOMAIN2 -eq 'csrt.com')
	{ $CLIENTCODE = 'CSRT'}
	if ($CLIENTDOMAIN2 -eq 'dampc.ca')
	{ $CLIENTCODE = 'DAMPC'}
	if ($CLIENTDOMAIN2 -eq 'dumoulintrucking.ca')
	{ $CLIENTCODE = 'DT'}
	if ($CLIENTDOMAIN2 -eq 'eastendconstruction.ca')
	{ $CLIENTCODE = 'EEC'}
	if ($CLIENTDOMAIN2 -eq 'energymizers.com')
	{ $CLIENTCODE = 'EMI'}
	if ($CLIENTDOMAIN2 -eq 'goldbelttire.com')
	{ $CLIENTCODE = 'GTS'}
	if ($CLIENTDOMAIN2 -eq 'gowestgold.com')
	{ $CLIENTCODE = 'GGL'}
	if ($CLIENTDOMAIN2 -eq 'grbelanger.com')
	{ $CLIENTCODE = 'GRB'}
	if ($CLIENTDOMAIN2 -eq 'carabellemotel.com')
	{ $CLIENTCODE = 'GRB'}
	if ($CLIENTDOMAIN2 -eq 'kapsuper8.onmicrosoft.com')
	{ $CLIENTCODE = 'S8K'}
	if ($CLIENTDOMAIN2 -eq 'kapsuper8.ca')
	{ $CLIENTCODE = 'S8K'}
	if ($CLIENTDOMAIN2 -eq 'super8kapuskasing.com')
	{ $CLIENTCODE = 'S8K'}
	if ($CLIENTDOMAIN2 -eq 'kivalliqinuit.ca')
	{ $CLIENTCODE = 'KIA'}
	if ($CLIENTDOMAIN2 -eq 'ml-law.ca')
	{ $CLIENTCODE = 'MA'}
	if ($CLIENTDOMAIN2 -eq 'makonsag.ca')
	{ $CLIENTCODE = 'MAHSI'}
	if ($CLIENTDOMAIN2 -eq 'moosecree.com')
	{ $CLIENTCODE = 'MCFN'}
	if ($CLIENTDOMAIN2 -eq 'mcteu.ca')
	{ $CLIENTCODE = 'MCTEU'}
	if ($CLIENTDOMAIN2 -eq 'mvdf.ca')
	{ $CLIENTCODE = 'MVDF'}
	if ($CLIENTDOMAIN2 -eq 'mfnrez.ca')
	{ $CLIENTCODE = 'MATFN'}
	if ($CLIENTDOMAIN2 -eq 'monetagold.com')
	{ $CLIENTCODE = 'MPMI'}
	if ($CLIENTDOMAIN2 -eq 'monetaporcupine.com')
	{ $CLIENTCODE = 'MPMI'}
	if ($CLIENTDOMAIN2 -eq 'sakkuenterprises.net')
	{ $CLIENTCODE = 'SEL'}
	if ($CLIENTDOMAIN2 -eq 'mtenterprises.ca')
	{ $CLIENTCODE = 'SEL'}
	if ($CLIENTDOMAIN2 -eq 'nccig.ca')
	{ $CLIENTCODE = 'NCC'}
	if ($CLIENTDOMAIN2 -eq 'nfmtc.ca')
	{ $CLIENTCODE = 'NFTC'}
	if ($CLIENTDOMAIN2 -eq 'niiwin.com')
	{ $CLIENTCODE = 'NINC'}
	if ($CLIENTDOMAIN2 -eq 'north35.ca')
	{ $CLIENTCODE = 'N35CP'}
	if ($CLIENTDOMAIN2 -eq 'northwoodhotel.com')
	{ $CLIENTCODE = 'BWPNH'}
	if ($CLIENTDOMAIN2 -eq 'nunasi.com')
	{ $CLIENTCODE = 'NC'}
	if ($CLIENTDOMAIN2 -eq 'paib.ca')
	{ $CLIENTCODE = 'PAIB'}
	if ($CLIENTDOMAIN2 -eq 'vhinsurance.ca')
	{ $CLIENTCODE = 'PAIB'}
	if ($CLIENTDOMAIN2 -eq 'lawbarrister.com')
	{ $CLIENTCODE = 'JPDBS'}
	if ($CLIENTDOMAIN2 -eq 'sakku.ca')
	{ $CLIENTCODE = 'SIC'}
	if ($CLIENTDOMAIN2 -eq 'sakkuproperties.net')
	{ $CLIENTCODE = 'SIC'}
	if ($CLIENTDOMAIN2 -eq 'nukik.ca')
	{ $CLIENTCODE = 'SIC'}
	if ($CLIENTDOMAIN2 -eq 'frigidrentals.com')
	{ $CLIENTCODE = 'FRI'}
	if ($CLIENTDOMAIN2 -eq 'groupetifgroup.com')
	{ $CLIENTCODE = 'FRI'}
	if ($CLIENTDOMAIN2 -eq 'timminschamber.on.com')
	{ $CLIENTCODE = 'TCOC'}
	if ($CLIENTDOMAIN2 -eq 'timminsnorthlandmonuments.com')
	{ $CLIENTCODE = 'TNM'}
	if ($CLIENTDOMAIN2 -eq 'timminstablet.com')
	{ $CLIENTCODE = 'TT'}
	if ($CLIENTDOMAIN2 -eq 'tndgp.ca')
	{ $CLIENTCODE = 'TNDGP'}
	if ($CLIENTDOMAIN2 -eq 'travelbos.ca')
	{ $CLIENTCODE = 'TPIUNKNOWN'}
	if ($CLIENTDOMAIN2 -eq 'viauplumbing.com')
	{ $CLIENTCODE = 'VPHI'}
	if ($CLIENTDOMAIN2 -eq 'wabun.on.ca')
	{ $CLIENTCODE = 'WTC'}
	if ($CLIENTDOMAIN2 -eq 'wahgoshigresources.com')
	{ $CLIENTCODE = 'WRI'}
	if ($CLIENTDOMAIN2 -eq 'wakenagun.ca')
	{ $CLIENTCODE = 'WCFDC'}

    #Connect to Exchange online and create ATP Rules
    Write-host "Logging into portal for $($client.Name) with Client Code $($CLIENTCODE)
    $DelegatedOrgURL = "https://ps.outlook.com/powershell-liveid?DelegatedOrg=" + $ClientDomain.Name"
    $ExchangeOnlineSession = New-PSSession -ConnectionUri $DelegatedOrgURL -Credential $credential -Authentication Basic -ConfigurationName Microsoft.Exchange -AllowRedirection
    Import-PSSession -Session $ExchangeOnlineSession -AllowClobber -DisableNameChecking
    #Ensure GWNTC Help Address is External Contact
	Write-Host "Adding GWNTC Help as an external Contact for Client Code $($CLIENTCODE)"
    New-MailContact -Name "GWNTC Helpdesk" -ExternalEmailAddress help@greatwhitenorth.com -Alias gwntchelpdsk

    $domains= Get-AcceptedDomain
    $GWNHELPEMAIL= help@greatwhitenorth.com

    #Configure default Safe Links policy and rule:
	Write-Host "Adding Safe Links Rules for Client Code $($CLIENTCODE)"
    New-SafeLinksPolicy -Name "GWN Safe Links Policy" -IsEnabled $true -EnableSafeLinksForTeams $true -scanurls $true -DeliverMessageAfterScan $true -DoNotAllowClickThrough $true -enableforinternalsenders $true -DoNotTrackUserClicks $false 
    New-SafeLinksRule -Name "GWN Safe Links Rule" -SafeLinksPolicy "Safe Links Policy" -RecipientDomainIs $domains[0] 

    #Configure default Safe Attachments policy and rule:
	Write-Host "Adding Safe Attachement Rule for Client Code $($CLIENTCODE)"
    New-SafeAttachmentPolicy -Name "GWN Safe Attachment Policy" -Enable $true -Redirect $false -RedirectAddress $GWNHELPEMAIL 
    New-SafeAttachmentRule -Name "GWN Safe Attachment Rule" -SafeAttachmentPolicy "Safe Attachment Policy" -RecipientDomainIs $domains[0] 

    #Configure the default Anti-phish policy and rule: 
	Write-Host "Adding Anti-Phish Rules for Client Code $($CLIENTCODE)"
    New-AntiPhishPolicy -Name "GWN AntiPhish Policy" -Enabled $true -EnableOrganizationDomainsProtection $true -EnableSimilarUsersSafetyTips $true -EnableSimilarDomainsSafetyTips $true -EnableUnusualCharactersSafetyTips $true -AuthenticationFailAction Quarantine -EnableMailboxIntelligenceProtection $true -MailboxIntelligenceProtectionAction movetoJMF -PhishThresholdLevel 2 -TargetedUserProtectionAction movetoJMF -EnableTargetedDomainsProtection $true -TargetedDomainProtectionAction MovetoJMF -EnableAntispoofEnforcement $true 
    New-AntiPhishRule -Name "GWN AntiPhish Rule" -AntiPhishPolicy "AntiPhish Policy" -RecipientDomainIs $domains[0] 

    #Configure ATP for Office 365 apps (Off by Default): 
	Write-Host "Adding ATP Rules for Client Code $($CLIENTCODE)"
    Set-AtpPolicyForO365 -EnableATPForSPOTeamsODB $true -allowclickthrough $false -TrackClicks $true 

    #Spamfiltersettings Office365 
	Write-Host "Setting Spam Filter Settings for Client Code $($CLIENTCODE)"
    Set-HostedContentFilterPolicy -Identity "Default" -SpamAction MoveToJmf -BulkSpamAction MoveToJmf -HighConfidenceSpamAction MoveToJmf -BulkThreshold 5 -IncreaseScoreWithBizOrInfoUrls On `
    -IncreaseScoreWithImageLinks On -IncreaseScoreWithNumericIps On -IncreaseScoreWithRedirectToOtherPort On -MarkAsSpamBulkMail On -MarkAsSpamEmbedTagsInHtml On -MarkAsSpamEmptyMessages On `
    -MarkAsSpamFormTagsInHtml On -MarkAsSpamFramesInHtml On -MarkAsSpamFromAddressAuthFail On -MarkAsSpamJavaScriptInHtml On -MarkAsSpamNdrBackscatter On -MarkAsSpamObjectTagsInHtml On `
    -MarkAsSpamSpfRecordHardFail On -MarkAsSpamWebBugsInHtml On -MarkAsSpamSensitiveWordList On -TestModeAction AddXHeader

    #Malwarefiltersettings Office365 
	Write-Host "Setting Malware Filters for Client Code $($CLIENTCODE)"
    Set-MalwareFilterPolicy -Identity "Default" -Action DeleteAttachmentAndUseDefaultAlertText -EnableFileFilter $true -FileTypes ".cpl", ".ace", ".app",".docm",".exe",".jar",".reg",".scr",".vbe",".vbs",".bat",".msi", `
    ".ani", ".dll", ".lnf", ".mdb", ".ws", ".cmd", ".com", ".crt", ".dos", ".lns", ".ps1", ".wsh", ".wsc" -EnableExternalSenderNotifications $true -EnableInternalSenderNotifications $true 
     
    #Default Sharing Policy Calendar 
	Write-Host "Setting Calendar Sharing Rules for Client Code $($CLIENTCODE)"
    Set-SharingPolicy -Identity "GWN Default Sharing Policy" -Domains @{Remove="Anonymous:CalendarSharingFreeBusyReviewer", "Anonymous:CalendarSharingFreeBusySimple", "Anonymous:CalendarSharingFreeBusyDetail"} 
    Set-SharingPolicy -Identity "GWN Default Sharing Policy" -Domains "*:CalendarSharingFreeBusySimple" 

    #Audit log for all users 
	Write-Host "Enabling Audit Log for All Users for Client Code $($CLIENTCODE)"
    Set-AdminAuditLogConfig -UnifiedAuditLogIngestionEnabled $true 
    Get-EXOMailbox -ResultSize Unlimited -Filter {RecipientTypeDetails -eq "UserMailbox" -or RecipientTypeDetails -eq "SharedMailbox" -or RecipientTypeDetails -eq "RoomMailbox" -or RecipientTypeDetails -eq "DiscoveryMailbox"} `
    | Set-Mailbox -AuditEnabled $true -AuditLogAgeLimit 180 -AuditAdmin Update, MoveToDeletedItems, SoftDelete, HardDelete, SendAs, SendOnBehalf, Create, UpdateFolderPermission `
    -AuditDelegate Update, SoftDelete, HardDelete, SendAs, Create, UpdateFolderPermissions, MoveToDeletedItems, SendOnBehalf `
    -AuditOwner UpdateFolderPermission, MailboxLogin, Create, SoftDelete, HardDelete, Update, MoveToDeletedItems

    Get-EXOMailbox -ResultSize Unlimited | Select Name, AuditEnabled, AuditLogAgeLimit | Out-Gridview 

    # Disable Imap & POP 
	Write-Hosts "Diabling IMAP & POP for Client Code $($CLIENTCODE)"
    Get-CASMailboxPlan | Set-CASMailboxPlan -ImapEnabled $false -PopEnabled $false 

    #Block Client Forwarding Rules
	#Blocks external forwarding to non-tenant addresses
	Write-Host "Adding External Forward Block CLient Rule"
    New-TransportRule -name "GWNTC Client Rules To External Block" -Priority 0 -SentToScope NotInOrganization -FromScope InOrganization -MessageTypeMatches AutoForward -RejectMessageEnhancedStatusCode 5.7.1 -RejectMessageReasonText $rejectMessageText -Set-RemoteDomain -AutoForwardEnabled $false
    Remove-PSSession $ExchangeOnlineSession
	
	#Write Complete Message 
	Wrtie-Host "Configuration Complete for Client Code $($CLIENTCODE)"
}