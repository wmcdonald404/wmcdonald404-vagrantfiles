# Windows PowerShell script for AD DS Deployment

# Set a default SafeModeAdministratorPassword
# This is a Vagrant box, please don't do this near real infrastructure :)
$Password = ConvertTo-SecureString $Env:COMPUTERNAME -AsPlainText -Force

# Install the necessary feature and module for AD management
Install-WindowsFeature AD-Domain-Services -IncludeManagementTools
Import-Module ADDSDeployment

# Set our domain/subdomain.
# Vagrant will assign a pseudo-random hostname, e.g.: WIN-A621GKNALNJ
# $Env:COMPUTERNAME.Split('-')[0].ToUpper() will return 'WIN' for the NetBIOS domain name
# $Env:COMPUTERNAME.Replace("-",".") will return WIN.A621GKNALNJ for the AD domain name.
$Params = @{
    CreateDnsDelegation = $false
    DatabasePath = 'C:\Windows\NTDS'
    DomainMode = 'WinThreshold'
    DomainName = $Env:COMPUTERNAME.Replace("-",".")
    DomainNetbiosName = $Env:COMPUTERNAME.Split('-')[0].ToUpper()
    ForestMode = 'WinThreshold'
    InstallDns = $true
    LogPath = 'C:\Windows\NTDS'
    NoRebootOnCompletion = $true
    SafeModeAdministratorPassword = $Password
    SysvolPath = 'C:\Windows\SYSVOL'
    Force = $true
}

Install-ADDSForest @Params