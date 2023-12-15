<#
This Script will copy content from onedrive to another onedrive within the same company
By: Jleroux from componets from CIPP
#>
Write-Host @"
                                      @@@                                       
                                     @///@@                                     
                                    @/////@@                                    
                                   @////////@                                   
                                 @@//////////@                                  
                                @@////////////@@                                
                               @@/////@////////@@                               
                              @//////@@/////////@@                              
                             @/////@@@@///////////@                             
                            @/////@@ @@////////////@                            
                          @@/////@@  @@/////////////@@                          
                         @@/////@    @@//////////////@@                         
                        @@/////@     @@////////////////@                        
                       @//////@      @@/////////////////@                       
                      @/////@@       #@//////////////////@@                     
                     @/////@@        #@///////////////////@@                    
                   @@/////@@          @////////////////////&@                   
                  @@/////@            @//////////////////////@                  
                 @@/////@             @///////////////////////@                 
                @//////@              @////////////////////////@@               
               @/////@@               @/////////////////////////@@              
              @/////@@                @///////////////////////////@             
            @@/////@@                 @////////////////////////////@            
           @@/////@*                  @/////////////////////////////@@          
          @@/////@                    @//////////////////////////////@@         
         @//////@                     @///////////////////////////////(@        
        @/////(@                      @/////////////////////////////////@       
       @/////@@                       @//////////////////////////////////@*     
     &@/////@@                        @///////////////////////////////////@@    
    @@/////@@                         @////////////////////////////////////@@   
   @@/////@                           @//////////////////////////////////////@  
  @//////@@                           @///////////////////////////////////////@ 
  @#////////@@                        @//////////////////////////////////////@@ 
    @@////////@@,                     @///////////////////////////////////@@    
       @@////////@@                   @////////////////////////////////@@       
          @@////////@@                @//////////////////////////////@@         
             @@////////@@             @///////////////////////////@@            
               @@////////@@           @/////////////////////////@@              
                  @@////////@@        @//////////////////////@@                 
                     @@////////@@     @///////////////////@@                    
                        @@////////@@  @/////////////////@@                      
                          @@////////@@@//////////////@@                         
                             @@////////////////////@@                           
                                @@//////////////@@                              
                                   @@////////@@                                 
                                     @@////@@                                   
                                         .     
"@
Write-Host "=============================================================================="
Write-Host "=                    GWNTC - OneDrive Copy Utility                           ="
Write-Host "=            For moving files from one user to another with ease             ="
Write-Host "=              Version: 1.0                         Author: JL               ="
Write-Host "=============================================================================="
Write-Host " If there are any issues with the script create a task with the details of the"
Write-Host " issues for the Author, include errors and screenshots."
Write-Host ""
# Check for Modules 
Write-Host "Checking for SharePoint Online PS Module"
if (Get-Module -ListAvailable -Name PnP.PowerShell) {
    Write-Host "Module exists"
} 
else {
    Write-Host "Module does not exist, attempting to install"
    Install-Module SharePointPnPPowerShellOnline -Force
}
Write-Host "Checking for MSOnline PS Module"
if (Get-Module -ListAvailable -Name SharePointPnPPowerShellOnline) {
    Write-Host "Module exists"
} 
else {
    Write-Host "Module does not exist, attempting to install"
    Install-Module Install-Module MSOnline -Force
}
#Set Variables 
$fromuser = Read-Host "Enter the e-mail address of the user you want to copy from"
Write-Host "You have entered $($fromuser)"
Write-Host ""
$destinationuser = Read-Host "Enter the e-mail address of the user that to receive the files"
Write-Host "You have entered $($destinationuser)"
Write-Host ""
Write-Warning "Do you wish to proceed." -WarningAction Inquire
Write-Host ""
$globaladmin = Read-Host "Enter the username of the client's Global Admin account"
$credentials = Get-Credential -Credential $globaladmin

#Connect with GA
Connect-MsolService -Credential $credentials

#Find Subdomain
$InitialDomain = Get-MsolDomain | Where-Object {$_.IsInitial -eq $true}

#Set Sharepoint root
$SharePointAdminURL = "https://$($InitialDomain.Name.Split(".")[0])-admin.sharepoint.com"

#Declare renamed to and from users
$fromuserUnderscore = $fromuser -replace "[^a-zA-Z]", "_"
$destinationUserUnderscore = $destinationuser -replace "[^a-zA-Z]", "_"
  
$departingOneDriveSite = "https://$($InitialDomain.Name.Split(".")[0])-my.sharepoint.com/personal/$fromuserUnderscore"
$destinationOneDriveSite = "https://$($InitialDomain.Name.Split(".")[0])-my.sharepoint.com/personal/$destinationUserUnderscore"
Write-Host "`nConnecting to SharePoint Online" -ForegroundColor Blue
Connect-PnPOnline -Url $SharePointAdminURL -Credential $credentials

Write-Host "`nAdding $globaladmin as site collection admin on both OneDrive site collections" -ForegroundColor Blue

# Set current admin as a Site Collection Admin on both OneDrive Site Collections
Set-SPOUser -Site $departingOneDriveSite -LoginName $globaladmin -IsSiteCollectionAdmin $true
Set-SPOUser -Site $destinationOneDriveSite -LoginName $globaladmin -IsSiteCollectionAdmin $true
  
Write-Host "`nConnecting to $fromuser's OneDrive via SharePoint Online PNP module" -ForegroundColor Blue
  
Connect-PnPOnline -Url $departingOneDriveSite -Credentials $credentials
  
Write-Host "`nGetting display name of $fromuser" -ForegroundColor Blue

# Get name of departing user to create folder name.
$departingOwner = Get-PnPSiteCollectionAdmin | Where-Object {$_.loginname -match $fromuser}
  
# If there's an issue retrieving the departing user's display name, set this one.
if ($departingOwner -contains $null) {
    $departingOwner = @{
        Title = "Departing User"
    }
}
  
# Define relative folder locations for OneDrive source and destination
$departingOneDrivePath = "/personal/$fromuserUnderscore/Documents"
$destinationOneDrivePath = "/personal/$destinationUserUnderscore/Documents/$($departingOwner.Title)'s Files"
$destinationOneDriveSiteRelativePath = "Documents/$($departingOwner.Title)'s Files"
  
Write-Host "`nGetting all items from $($departingOwner.Title)" -ForegroundColor Blue
# Get all items from source OneDrive
$items = Get-PnPListItem -List Documents -PageSize 1000
  
$largeItems = $items | Where-Object {[long]$_.fieldvalues.SMTotalFileStreamSize -ge 261095424 -and $_.FileSystemObjectType -contains "File"}
if ($largeItems) {
    $largeexport = @()
    foreach ($item in $largeitems) {
        $largeexport += "$(Get-Date) - Size: $([math]::Round(($item.FieldValues.SMTotalFileStreamSize / 1MB),2)) MB Path: $($item.FieldValues.FileRef)"
        Write-Host "File too large to copy: $($item.FieldValues.FileRef)" -ForegroundColor DarkYellow
    }
    $largeexport | Out-file C:\temp\largefiles.txt -Append
    Write-Host "A list of files too large to be copied from $($departingOwner.Title) have been exported to C:\temp\LargeFiles.txt" -ForegroundColor Yellow
}
  
$rightSizeItems = $items | Where-Object {[long]$_.fieldvalues.SMTotalFileStreamSize -lt 261095424 -or $_.FileSystemObjectType -contains "Folder"}
  
Write-Host "`nConnecting to $destinationuser via SharePoint PNP PowerShell module" -ForegroundColor Blue
Connect-PnPOnline -Url $destinationOneDriveSite -Credentials $credentials
  
Write-Host "`nFilter by folders" -ForegroundColor Blue
# Filter by Folders to create directory structure
$folders = $rightSizeItems | Where-Object {$_.FileSystemObjectType -contains "Folder"}
  
Write-Host "`nCreating Directory Structure" -ForegroundColor Blue
foreach ($folder in $folders) {
    $path = ('{0}{1}' -f $destinationOneDriveSiteRelativePath, $folder.fieldvalues.FileRef).Replace($departingOneDrivePath, '')
    Write-Host "Creating folder in $path" -ForegroundColor Green
    $newfolder = Ensure-PnPFolder -SiteRelativePath $path
}
  
 
Write-Host "`nCopying Files" -ForegroundColor Blue
$files = $rightSizeItems | Where-Object {$_.FileSystemObjectType -contains "File"}
$fileerrors = ""
foreach ($file in $files) {
      
    $destpath = ("$destinationOneDrivePath$($file.fieldvalues.FileDirRef)").Replace($departingOneDrivePath, "")
    Write-Host "Copying $($file.fieldvalues.FileLeafRef) to $destpath" -ForegroundColor Green
    $newfile = Copy-PnPFile -SourceUrl $file.fieldvalues.FileRef -TargetUrl $destpath -OverwriteIfAlreadyExists -Force -ErrorVariable errors -ErrorAction SilentlyContinue
    $fileerrors += $errors
}
$fileerrors | Out-File c:\temp\fileerrors.txt
  
# Remove Global Admin from Site Collection Admin role for both users
Write-Host "`nRemoving $globaladmin from OneDrive site collections" -ForegroundColor Blue
Set-SPOUser -Site $departingOneDriveSite -LoginName $globaladmin -IsSiteCollectionAdmin $false
Set-SPOUser -Site $destinationOneDriveSite -LoginName $globaladmin -IsSiteCollectionAdmin $false
Write-Host "`nComplete!" -ForegroundColor Green
Write-Host -NoNewLine 'Press any key to continue...';
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');