<#
This file serves as a template for the variable seelctions that can be used in PowerShell scripts for Office M365.  
This is not ready for use in production 
#>
#Log into Tenant
Connect-MsolService

#Get Primary Domain and set variable
Connect-MgGraph -Scopes "Domain.Read.All"
$CLIENTDOMAIN = (Get-MgDomain | Where-Object {$_.isDefault}).Id

#Set CLient Code 
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

<# Debugging
Write-Host "Client Code: $ClientCode"
Write-Host "Client Domain: $CLIENTDOMAIN"
#> 

