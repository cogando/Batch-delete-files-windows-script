
# Batch-delete-files-windows-script

A lightweight PowerShell utility for batch‑deleting files based on a specified keyword or file type.

## Description
This script scans a target directory for files matching a keyword or extension, moves the results into a temporary folder, and prompts you to confirm deletion. It provides a controlled, repeatable way to remove redundant or unnecessary files and reclaim disk space.  

### Requirements
+ powershell
+ Script Execution enabled
+ Administrator privileges
    
### Features

+ A screenshot of the confirmation message before deletion.
This reassures users that the script won’t delete anything without approval
+ File Verification before deletion
+ Option to create a temporary folder or use an existing one

 *Disclaimer: The folder used for staging will be deleted. Do not select a folder containing important or system‑critical files.*

### Known Issues
+ Multiple keywords are not supported. The script will fail if more than one keyword is provided, but it will not give an error.

### Steps to install and use
Follow these steps to get and run the script **Admin Privileges Required**
1. Clone Repository Here's the [cloning a Repository instruction manual](https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository)
2. Run PowerShell as admin
3. unblock file - Right click on file > properties > unblock > apply > ok
4. Run the command `Set-Execution-Policy` if not already configured
5. Run the script and follow the prompt
