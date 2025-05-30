# Windows PowerShell script for AD DS Deployment

function Initialize-Domain {
    Install-WindowsFeature AD-Domain-Services -IncludeManagementTools
    Import-Module ADDSDeployment
    # Set a default SafeModeAdministratorPassword
    # This is a Vagrant box, *please* don't do this near real infrastructure :)
    $Password = ConvertTo-SecureString [Environment]::MachineName -AsPlainText -Force

    # Set our domain/subdomain.
    # Vagrant will assign a pseudo-random hostname, e.g.: WIN-A621GKNALNJ
    # $Env:COMPUTERNAME.Split('-')[0].ToUpper() will return 'WIN' for the NetBIOS domain name
    # $Env:COMPUTERNAME.Replace("-",".") will return WIN.A621GKNALNJ for the AD domain name.
    $Params = @{
        CreateDnsDelegation = $false
        DatabasePath = 'C:\Windows\NTDS'
        DomainMode = 'WinThreshold'
        DomainName = [Environment]::MachineName.Replace("-",".")
        DomainNetbiosName = [Environment]::MachineName.Split('-')[0].ToUpper()
        Force = $true
        ForestMode = 'WinThreshold'
        InstallDns = $true
        LogPath = 'C:\Windows\NTDS'
        NoRebootOnCompletion = $true
        SafeModeAdministratorPassword = $Password
        SysvolPath = 'C:\Windows\SYSVOL'
        WarningAction = 'Ignore'
    }

    Install-ADDSForest @Params
}

try {
    # if (Get-ADDomainController) {}
    if ([Environment]::MachineName -eq (Get-ADDomainController).Hostname.Split('.')[0])
    {
        $Domain = (Get-ADDomainController).Domain
        Write-Output "Already Domain Controller for Domain: $Domain" 
    }
} catch {
    Initialize-Domain
}


