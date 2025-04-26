$Users = @(
    @{
        Enabled = $true
        ChangePasswordAtLogon = $false
        UserPrincipalName = "dallas@nostromo.com"
        Name = "dallas"
        GivenName = "Captain"
        Surname = "Dallas"
        DisplayName = "Captain Dallas"
        Office = "Bridge"
        # This is a Vagrant box, *please* don't do this near real infrastructure :)
        AccountPassword = ConvertTo-SecureString [Environment]::MachineName -AsPlainText -Force
    }
    @{
        Enabled = $true
        ChangePasswordAtLogon = $false
        UserPrincipalName = "kane@nostromo.com"
        Name = "kane"
        GivenName = "XO"
        Surname = "Kane"
        DisplayName = "XO Kane"
        Office = "Bridge"
        AccountPassword = ConvertTo-SecureString [Environment]::MachineName -AsPlainText -Force
    }
    @{
        Enabled = $true
        ChangePasswordAtLogon = $false
        UserPrincipalName = "parker@nostromo.com"
        Name = "parker"
        GivenName = "Chief"
        Surname = "Parker"
        DisplayName = "Chief Parker"
        Office = "Engineering"
        AccountPassword = ConvertTo-SecureString [Environment]::MachineName -AsPlainText -Force
    }
)

$Users | foreach { 
    if (Get-ADUser $_.Name)
    {
        $Name = $_.Name
        Write-Output "Active Directory Domain User already exists: $Name" 
    }
    else
    {
        New-ADUser @_ 
    }
}

# PS> Add-ADGroupMember -Identity Officers -Members dallas, kane
# PS> Add-ADGroupMember -Identity Engineers -Members parker
