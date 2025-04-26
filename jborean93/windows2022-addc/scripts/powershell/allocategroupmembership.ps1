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
        AccountPassword = "Thatfigures." | ConvertTo-SecureString -AsPlainText -Force
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
        AccountPassword = "Sillyquestion?" | ConvertTo-SecureString -AsPlainText -Force
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
        AccountPassword = "Howyadoin?" | ConvertTo-SecureString -AsPlainText -Force
    }

)

$Users | foreach { New-ADUser @_ }


# PS> Add-ADGroupMember -Identity Officers -Members dallas, kane
# PS> Add-ADGroupMember -Identity Engineers -Members parker

$SecurityGroups = @(
    @{
        Name = "Officers"
        SamAccountName = "Officers"
        GroupCategory = "Security"
        GroupScope = "DomainLocal"
        DisplayName = "Bridge Officers"
        Description = "Members of Bridge Officers"
    }

    @{
        Name = "Engineers" 
        SamAccountName = "Engineers" 
        GroupCategory = "Security" 
        GroupScope = "DomainLocal" 
        DisplayName = "Engineering Crew"
        Description = "Members of Engineering Crew"
    }
)

$SecurityGroups | foreach { New-ADGroup @_ }