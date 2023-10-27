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
if ($CLIENTDOMAIN -eq 'example.com')
{ $CLIENTCODE = 'EXMPL'}

<# Debugging
Write-Host "Client Code: $ClientCode"
Write-Host "Client Domain: $CLIENTDOMAIN"
#> 

