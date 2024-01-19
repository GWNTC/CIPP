<#	
	.NOTES
	===========================================================================
	 Created on:   	2024-01-19 11:10 AM
	 Created by:   	lerouxj
	 Organization: 	GWNTC     	
	===========================================================================
	.DESCRIPTION
		Desinged to Deploy ATP Policies on a Tenant
#>
$domains = Get-AcceptedDomain
Write-Output "This Script will deploy ATP Policies on the client tenant, you will need the Global Administrative Account to Proceed"
Start-Sleep -Seconds 5
$ClientCode = Read-Host -Prompt "What is the Client Code?"
Write-Output "You will now be prompted to enter the Global Admin Account for $($ClientCode)"
Connect-ExchangeOnline
#SafeLinks
Write-Output "Adding Safe Links Rules for Client Code $($ClientCode)"
New-SafeLinksPolicy -Name "GWN Safe Links Policy" -EnableSafeLinksForTeams $true -scanurls $true -DeliverMessageAfterScan $true -enableforinternalsenders $true
New-SafeLinksRule -Name "GWN Safe Links Rule" -SafeLinksPolicy "GWNSafe Links Policy" -RecipientDomainIs $domains[0]
#SafeAttachments
Write-Output "Adding Safe Attachement Rule for Client Code $($CLIENTCODE)"
New-SafeAttachmentPolicy -Name "GWN Safe Attachment Policy" -Enable $true -Redirect $false -RedirectAddress help@greatwhitenorth.com
New-SafeAttachmentRule -Name "GWN Safe Attachment Rule" -SafeAttachmentPolicy "GWN Safe Attachment Policy" -RecipientDomainIs $domains[0]
#AntiPhish
Write-Output "Adding Anti-Phish Rules for Client Code $($CLIENTCODE)"
New-AntiPhishPolicy -Name "GWN AntiPhish Policy" -Enabled $true -EnableOrganizationDomainsProtection $true -EnableSimilarUsersSafetyTips $true -EnableSimilarDomainsSafetyTips $true -EnableUnusualCharactersSafetyTips $true -AuthenticationFailAction Quarantine -EnableMailboxIntelligenceProtection $true -MailboxIntelligenceProtectionAction movetoJMF -PhishThresholdLevel 2 -TargetedUserProtectionAction movetoJMF -EnableTargetedDomainsProtection $true -TargetedDomainProtectionAction MovetoJMF -EnableAntispoofEnforcement $true
New-AntiPhishRule -Name "GWN AntiPhish Rule" -AntiPhishPolicy "GWN AntiPhish Policy" -RecipientDomainIs $domains[0]
#Configure ATP for Office 365 apps (Off by Default): 
Write-Output "Adding ATP Rules for Client Code $($CLIENTCODE)"
Set-AtpPolicyForO365 -EnableATPForSPOTeamsODB $true
#Spamfiltersettings Office365 
Write-Output "Setting Spam Filter Settings for Client Code $($CLIENTCODE)"
Set-HostedContentFilterPolicy -Identity "Default" -SpamAction MoveToJmf -BulkSpamAction MoveToJmf -HighConfidenceSpamAction MoveToJmf -BulkThreshold 5 -IncreaseScoreWithBizOrInfoUrls On `
							  -IncreaseScoreWithImageLinks On -IncreaseScoreWithNumericIps On -IncreaseScoreWithRedirectToOtherPort On -MarkAsSpamBulkMail On -MarkAsSpamEmbedTagsInHtml On -MarkAsSpamEmptyMessages On `
							  -MarkAsSpamFormTagsInHtml On -MarkAsSpamFramesInHtml On -MarkAsSpamFromAddressAuthFail On -MarkAsSpamJavaScriptInHtml On -MarkAsSpamNdrBackscatter On -MarkAsSpamObjectTagsInHtml On `
							  -MarkAsSpamSpfRecordHardFail On -MarkAsSpamWebBugsInHtml On -MarkAsSpamSensitiveWordList On -TestModeAction AddXHeader
#DisableImapPOP
Write-Outputs "Diabling IMAP & POP for Client Code $($CLIENTCODE)"
Get-CASMailboxPlan | Set-CASMailboxPlan -ImapEnabled $false -PopEnabled $false
Remove-PSSession $ExchangeOnlineSession
Write-Output "Completed"