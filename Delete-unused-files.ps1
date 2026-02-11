#requires -RunAsAdministrator
$SourceFolder = Read-Host "Enter the path of the folder to search for files to delete (e.g., 'C:\Path\To\Source')"
$DestinationFolder = Read-Host "Enter the path of the folder you wish to move all deleted files to (e.g., 'C:\Path\To\Destination'). If folder does not exist, a new one will be created."
$FilesToDelete = Read-Host "Enter keyword to identify files to delete (e.g., 'report', or file extension like '.txt'). Note: Only one keyword can be used at a time."

# Create the destination folder if it does not exist
if (-not (Test-Path -Path $DestinationFolder)) {
    New-Item -ItemType Directory -Path $DestinationFolder
} elseif (Test-Path -Path $DestinationFolder) {
    <# Checks whether the file has already been created #>
    Write-Host "Destination folder is ready: $DestinationFolder"
} else {
    <# Action when all if and elseif conditions are false #>
    Write-Host "The destination folder already exists. Files will be moved to this folder.$DestinationFolder"
}

# Get all files in the source folder
try {
    Get-ChildItem -Path $SourceFolder -Filter "*$FilesToDelete*" -File | Move-Item -Destination $DestinationFolder
     Write-Host "All files matching '$FilesToDelete' have been moved to $DestinationFolder"
}
 
catch {
    <#Do this if a terminating exception happens#>
    Write-Error "An error occurred while moving files: $_"
    exit 1
}

#Allows to see which files would be removed without actually deleting them.
Get-ChildItem -Path $DestinationFolder -File
$FileVerification = Read-Host "Do you want to proceed with deleting ALL these files? (Y/N). press N to cancel or select which files to keep."

#deletes destination folder and all files within it if user confirms with "Y"
if ($FileVerification -eq "Y") {
    Remove-item -Path $DestinationFolder\* -Force
    Write-Host "All files in $DestinationFolder have been deleted."
} else{ 
    <# Action when this condition is true #>
    Write-Host "File deletion cancelled. You can review the files in $DestinationFolder and delete them manually if needed."
}
